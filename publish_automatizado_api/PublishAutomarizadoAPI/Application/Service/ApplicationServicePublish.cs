using PublishAutomarizadoAPI.Application.Interfaces;
using System;
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
        private readonly String PublishBuild = "/p:DeployOnBuild=true /p:PublishProfile=Simpliss";
        private readonly String init = "C:/SVN/";

        private readonly IApplicationServiceSistema _serviceSistema;

        public ApplicationServicePublish(IApplicationServiceSistema serviceSistema)
        {
            _serviceSistema = serviceSistema;
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

            Console.WriteLine("Iniciando a geração do publish");

            foreach (var IdSistema in dto.EsSistemas)
            {
                var sistema = await _serviceSistema.GetByIdAsync(IdSistema);

                if (sistema.Dependencia != null && sistema.Dependencia.SistemaCNDTOs != null && sistema.Dependencia.SistemaCNDTOs.Count > 0)
                {
                    foreach (var sistemaCn in sistema.Dependencia.SistemaCNDTOs)
                    {
                        Console.WriteLine($"Build CN: {sistemaCn.CaminhoSistemaCN}");
                        Processo($"{sistemaCn.CaminhoSistemaCN} {cnBuild}");
                    }
                }

                Console.WriteLine($"Build Publish: {sistema.CaminhoSistema}");
                Processo($"{sistema.CaminhoSistema} {PublishBuild}");

                nomeSistemas += sistema.NomeSistema + ", ";
            }

            Console.WriteLine("Finalizado a geração do publish");

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
            //string pathTemp = Path.Combine("C:", "Temp");
            string pathTemp = Path.Combine("\\192.168.1.100", "atualizacoes_emergenciais");

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

        private void Processo(String caminho)
        {
            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = $"/c {msBuild} {init}{caminho}";

                long peakPagedMem = 0, peakWorkingSet = 0, peakVirtualMem = 0;

                using (Process myProcess = Process.Start(startInfo))
                {
                    do
                    {
                        if (!myProcess.HasExited)
                        {
                            myProcess.Refresh();

                            peakPagedMem = myProcess.PeakPagedMemorySize64;
                            peakVirtualMem = myProcess.PeakVirtualMemorySize64;
                            peakWorkingSet = myProcess.PeakWorkingSet64;

                            if (myProcess.Responding)
                            {
                                Console.WriteLine("Status = Running");
                            }
                            else
                            {
                                Console.WriteLine("Status = Not Responding");
                                throw new Exception();
                            }
                        }
                    }
                    while (!myProcess.WaitForExit(1000));

                    Console.WriteLine();
                    Console.WriteLine($"Publish Gerado: {caminho}");
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
