#set up the preference objects
$global:PoshAWS = @{}
$PoshAWS.Preferences = @{}
$PoshAWS.Preferences += @{ "DefaultEC2InstanceType" = "m1.medium" }
$PoshAWS.Preferences += @{ "DefaultEC2SecurityGroup" = "quick-start-1" }
$PoshAWS.Preferences += @{ "AwsAccessKey" = "<enter here>" }
$PoshAWS.Preferences += @{ "AwsSecretKey" = "<enter here>" }
$PoshAWS.Preferences += @{ "ModuleRoot" = $(split-path $MyInvocation.MyCommand.Path) }

foreach ($file in $(gci "$($PoshAWS.Preferences.ModuleRoot)\Functions" *ps1)) { ."$($file.FullName)" }

Export-ModuleMember -Function * 

Get-Command -Module PoshAWS