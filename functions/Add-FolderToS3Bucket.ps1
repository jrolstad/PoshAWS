<#
.SYNOPSIS
Creates an empty folder at the desired path in an S3 bucket

.PARAMETER folderName
Path of the folder to create

.PARAMETER bucketName
Name of the bucket to push to

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Add-FolderToS3Bucket([string] $folderName,
                          [string] $bucketName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    $folderNameForS3 = $folderName.TrimEnd("/") + "/"
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $request = (New-Object Amazon.S3.Model.PutObjectRequest).WithBucketName($bucketName).WithKey($folderNameForS3).WithContentBody("")
    $awsClient.PutObject($request)
}