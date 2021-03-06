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
    
    $sr = new-object System.IO.StreamReader($response.GetJobOutputResult.Body)
    $contentsRaw = $sr.ReadToEnd();
    $sr.Dispose();

    $contents = ConvertFrom-Csv $contentsRaw
    
    $returnSet = @{}
    $returnSet += @{ "JobOutput" = $response.GetJobOutputResult }
    $returnSet += @{ "ParsedContent" = $contents }
    $returnSet += @{ "RawContent" = $contentsRaw }
    
    $returnSet
}