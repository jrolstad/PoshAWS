<#
.SYNOPSIS
Pushes a set of files to an existing Amazon S3 bucket

.PARAMETER files
File to push

.PARAMETER bucketName
Name of the bucket to push to

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS
#>
function Push-ToS3Bucket([string[]] $files,
                          [string] $bucketName,
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                          )
{
    
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $files | ForEach-Object {
            $request = (New-Object Amazon.S3.Model.PutObjectRequest).WithBucketName($bucketName).WithAutoCloseStream($true).WithFilePath($_)
            
            $awsClient.PutObject($request)
        }
    

    
}