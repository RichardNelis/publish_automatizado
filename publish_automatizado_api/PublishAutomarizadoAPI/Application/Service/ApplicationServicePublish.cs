using Microsoft.Extensions.Configuration;
using PublishAutomarizadoAPI.Application.Interfaces;
using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Service
{
    public class ApplicationServicePublish : IApplicationServicePublish
    {
        private readonly String msBuild = "\"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/MSBuild\"";
        private readonly String cnBuild = "/t:Clean,Build";
        private readonly String PublishBuild = "/p:DeployOnBuild=true /p:PublishProfile=Simpliss /property:Configuration=Release";
        private readonly String init;

        private readonly IApplicationServiceSistema _serviceSistema;

        public ApplicationServicePublish(IApplicationServiceSistema serviceSistema)
        {
            _serviceSistema = serviceSistema;

            init = new ConfigurationBuilder().AddJsonFile("appSettings.json").Build()["appSettings:Diretorio"];
        }

        public async Task GerarAsync(ChamadoDTO dto)
        {
            try
            {
                String nomeSistemas = await Publish(dto);

                string pathTemp = CreateDirectoryTemp();
                string pathChamado = CreateDirectoryChamado(dto, pathTemp);

                String pathPublish = Path.Combine(pathTemp, "publishes");
                String pathPublishChamado = Path.Combine(pathChamado, "publishes");

                CreateLogPublish(dto, nomeSistemas, pathChamado);

                Copy(pathPublish, pathPublishChamado);

                ZipFile.CreateFromDirectory(pathChamado, $"{pathChamado}.zip");

                Directory.Delete(pathPublish, true);
                Directory.Delete(pathChamado, true);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private async Task<string> Publish(ChamadoDTO dto)
        {
            String nomeSistemas = String.Empty;

            foreach (var IdSistema in dto.EsSistemas)
            {
                var sistema = await _serviceSistema.GetByIdAsync(IdSistema);

                if (sistema.Dependencia != null && sistema.Dependencia.SistemaCNDTOs != null && sistema.Dependencia.SistemaCNDTOs.Count > 0)
                {
                    foreach (var sistemaCn in sistema.Dependencia.SistemaCNDTOs)
                    {
                        String[] pathsCN = sistemaCn.CaminhoSistemaCN.Split('/');

                        String folderCN = $"{init}{pathsCN[0]}";

                        //ProcessoTortoiseCleanUP(folderCN);
                        //ProcessoTortoiseUpdate(folderCN);

                        ProcessoPublish($"{sistemaCn.CaminhoSistemaCN} {cnBuild}");
                    }
                }

                String[] paths = sistema.CaminhoSistema.Split('/');

                String folder = $"{init}{paths[0]}";

                //ProcessoTortoiseCleanUP(folder);
                //ProcessoTortoiseUpdate(folder);

                ProcessoPublish($"{sistema.CaminhoSistema} {cnBuild} {PublishBuild}");

                //ProcessoTortoiseCleanUP(folder);

                nomeSistemas += sistema.NomeSistema + ", ";
            }

            nomeSistemas = nomeSistemas.Substring(0, nomeSistemas.Length - 2);
            return nomeSistemas;
        }

        private static void CreateLogPublish(ChamadoDTO dto, string nomeSistemas, string pathChamado)
        {
            string pathLog = Path.Combine(pathChamado, "log.txt");

            if (!File.Exists(pathLog))
            {
                using (StreamWriter sw = File.CreateText(pathLog))
                {
                    sw.WriteLine($"Responsável: {dto.Resposavel}");
                    sw.WriteLine($"Chamado: {dto.NumeroChamado}");
                    sw.WriteLine($"Município(s): {dto.Municipio}");
                    sw.WriteLine($"Sistema(s): {nomeSistemas}");
                }
            }
        }

        private static string CreateDirectoryChamado(ChamadoDTO dto, string pathTemp)
        {
            string pathChamado = Path.Combine(pathTemp, $"Chamado_{dto.NumeroChamado}_{dto.Municipio}");

            if (!Directory.Exists(pathChamado))
            {
                Directory.CreateDirectory(pathChamado);
            }

            return pathChamado;
        }

        private static string CreateDirectoryTemp()
        {
            string pathTemp = Path.Combine("C:", "Temp");

            if (!Directory.Exists(pathTemp))
            {
                Directory.CreateDirectory(pathTemp);
            }

            return pathTemp;
        }

        public static void Copy(string sourceDirectory, string targetDirectory)
        {
            var diSource = new DirectoryInfo(sourceDirectory);
            var diTarget = new DirectoryInfo(targetDirectory);

            CopyAll(diSource, diTarget);
        }

        public static void CopyAll(DirectoryInfo source, DirectoryInfo target)
        {
            Directory.CreateDirectory(target.FullName);

            // Copy each file into the new directory.
            foreach (FileInfo fi in source.GetFiles())
            {
                Console.WriteLine(@"Copying {0}\{1}", target.FullName, fi.Name);
                fi.CopyTo(Path.Combine(target.FullName, fi.Name), true);
            }

            // Copy each subdirectory using recursion.
            foreach (DirectoryInfo diSourceSubDir in source.GetDirectories())
            {
                DirectoryInfo nextTargetSubDir =
                    target.CreateSubdirectory(diSourceSubDir.Name);
                CopyAll(diSourceSubDir, nextTargetSubDir);
            }
        }

        private void ProcessoPublish(String caminho)
        {
            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = $"/c {msBuild} {init}{caminho}";

                using (Process process = Process.Start(startInfo))
                {
                    process.WaitForExit();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void ProcessoTortoiseCleanUP(String caminho)
        {
            String cleanUP = $"/command:cleanup /noui /noprogressui /nodlg /vacuum /breaklocks /refreshshell /delignored /delunversioned /revert /path:\"{caminho}\"";

            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.FileName = "TortoiseProc.exe";
                startInfo.Arguments = $"{cleanUP}";

                using (Process process = Process.Start(startInfo))
                {
                    process.WaitForExit();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void ProcessoTortoiseUpdate(String caminho)
        {
            String update = $"/command:update /path:\"{caminho}\"";

            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo("cmd.exe", $"/c \"C:\\Program Files\\TortoiseSVN\\bin\\TortoiseProc.exe\" {update}");

                using (Process process = Process.Start(startInfo))
                {
                    process.WaitForExit();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
