locals {
  build_command = coalesce(var.build_command_override, local.default_build_command)
  default_build_command = <<BUILDCOMMAND
  msbuild /nologo /p:Configuration=${var.build_configuration} /p:DeployOnBuild=true /p:WebPublishMethod=Package /p:PackageAsSingleFile=true /p:platform="Any CPU" /p:SkipInvalidConfigurations=true /p:DesktopBuildPackageLocation="C:${var.artifact_path}\${var.codebuild_name}.zip"
  BUILDCOMMAND
}
