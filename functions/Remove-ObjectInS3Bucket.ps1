<#
.SYNOPSIS
Removes an item in an S3 bucket

.PARAMETER fileName
Name of the file to remove from the bucket

.PARAMETER bucketName
Name of the bucket to remove the file from

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Remove-ObjectInS3Bucket(
                            [string] $fileName,
                            [string] $bucketName,
                            [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                            [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $request = (New-Object Amazon.S3.Model.DeleteObjectRequest).WithBucketName($bucketName).WithKey($fileName)
    $awsClient.DeleteObject($request)
}