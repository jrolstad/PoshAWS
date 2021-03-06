<#
.SYNOPSIS
Gets all Glacier Vaults

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-GlacierVaults([string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)
    
    $response = $awsClient.ListVaults();
    
    $response.ListVaultsResult.VaultList;
}