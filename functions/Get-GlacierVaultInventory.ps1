<#
.SYNOPSIS
Invokes a job that initiates the process to get a glacier inventory

.PARAMETER vaultName
Name of the vault to get inventory for

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-GlacierVaultInventory(
                          [string] $vaultName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $awsClient = New-Object Amazon.Glacier.AmazonGlacierClient ($awsAccessKey,$awsSecretKey)
    

    $jobParameters = New-Object Amazon.Glacier.Model.JobParameters;
    $foo = $jobParameters.WithType("inventory-retrieval");
    $f00 = $jobParameters.WithFormat("CSV");
	
    $request = New-Object Amazon.Glacier.Model.InitiateJobRequest;
    $foo = $request.WithVaultName($vaultName);
    $foo = $request.WithJobParameters($jobParameters);
    
    $response = $awsClient.InitiateJob($request);
    
    $response.InitiateJobResult;
}