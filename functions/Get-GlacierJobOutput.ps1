<#
.SYNOPSIS
Gets the output of a glacier job for a specific job and vault

.PARAMETER jobId
Job Id to get the output for

.PARAMETER vaultName
Name of the vault to get inventory for

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-GlacierJobOutput(
                          [string] $jobId,
                          [string] $vaultName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)

    $request = New-Object Amazon.Glacier.Model.GetJobOutputRequest;
    $foo = $request.WithJobId($jobId);
    $foo = $request.WithVaultName($vaultName);
    
    $response = $awsClient.GetJobOutput($request);
    
    $response.GetJobOutputResult;
}