param(
    [switch]$ci
)
$ErrorActionPreference = 'stop'

$Configuration = if ($ci) { 'Release' } else { 'Debug' }
$repoRoot = Resolve-Path "$PSScriptRoot/../.."
$msbuildEngine = 'dotnet'

& "$repoRoot\eng\common\msbuild.ps1" -ci:$ci "$repoRoot/eng/CodeGen.proj" `
    /t:GenerateProjectList `
    /bl:artifacts/log/genprojlist.binlog
