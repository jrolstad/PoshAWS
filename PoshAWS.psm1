#set up the preference objects
$global:PoshAWS = @{}
$PoshAWS.Preferences = @{}
$PoshAWS.Preferences += @{ "AwsAccessKey" = "<enter here>" }
$PoshAWS.Preferences += @{ "AwsSecretKey" = "<enter here>" }
$PoshAWS.Preferences += @{ "ModuleRoot" = $(split-path $MyInvocation.MyCommand.Path) }

foreach ($file in $(gci "$($PoshAWS.Preferences.ModuleRoot)\Functions" *ps1)) { ."$($file.FullName)" }

Export-ModuleMember -Function * 

Get-Command -Module PoshAWS