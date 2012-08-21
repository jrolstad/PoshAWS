<#
.SYNOPSIS
Removes an S3 bucket

.PARAMETER bucketName
Name of the bucket to remove

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Remove-S3Bucket([string] $bucketName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $request = (New-Object Amazon.S3.Model.DeleteBucketRequest).WithBucketName($bucketName)
    $awsClient.DeleteBucket($request)
}