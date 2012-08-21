<#
.SYNOPSIS
Obtains a list of contents in the S3 bucket

.PARAMETER bucketName
Name of the bucket to get contents from

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Get-S3BucketContents([string] $bucketName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $request = (New-Object Amazon.S3.Model.ListObjectsRequest).WithBucketName($bucketName)
    
    [xml]$response = $awsClient.ListObjects($request)
    
    $response.ListObjectsResponse.S3Objects
}