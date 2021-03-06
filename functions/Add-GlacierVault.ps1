<#
.SYNOPSIS
Creates a new Glacier vault

.PARAMETER vaultName
Name of the vault to add

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Add-GlacierVault([string] $vaultName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)
    
    $request = New-Object Amazon.Glacier.Model.CreateVaultRequest;
    $foo = $request.WithVaultName($vaultName);
    
    $response = $awsClient.CreateVault($request);
    
    $response.CreateVaultResult;
}