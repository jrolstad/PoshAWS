<#
.SYNOPSIS
Removes an existing glacier vault

.PARAMETER vaultName
Name of the vault to delete

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Remove-GlacierVault([string] $vaultName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)
    
    $request = New-Object Amazon.Glacier.Model.DeleteVaultRequest;
    $foo = $request.WithVaultName($vaultName);
    
    $response = $awsClient.DeleteVault($request);

}