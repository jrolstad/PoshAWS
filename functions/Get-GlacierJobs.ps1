<#
.SYNOPSIS
Gets all Glacier Jobs

.PARAMETER vaultName
Name of the vault to get inventory for

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-GlacierJobs(
                          [string] $vaultName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)

    $request = New-Object Amazon.Glacier.Model.ListJobsRequest;
    $foo = $request.WithVaultName($vaultName);
    
    $response = $awsClient.ListJobs($request);
    
    $response.ListJobsResult.JobList;
}