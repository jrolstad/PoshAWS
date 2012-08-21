<#
.SYNOPSIS
Gets all S3 buckets

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-S3Buckets([string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    [xml] $response = $awsClient.ListBuckets();
    
    $response.ListBucketsResponse.buckets
}