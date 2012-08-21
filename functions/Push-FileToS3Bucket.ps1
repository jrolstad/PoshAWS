<#
.SYNOPSIS
Pushes a set of files to an existing Amazon S3 bucket

.PARAMETER filePath
File to push

.PARAMETER bucketName
Name of the bucket to push to

.PARAMETER s3FileName
Name (Path) of the file in the S3 bucket

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS

.PARAMETER preserveHierarchy
If the directory hierarchy should be maintained
#>
function Push-FileToS3Bucket([string] $filePath,
                          [string] $bucketName,
                          [string] $s3FileName = "",   
                          [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                          [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey,
                          [switch] $preserveHierarchy
                          )
{
    # Get the name of the file for S3
    if($s3FileName -eq "")
    {
        # Keep the hierarchy / folder structure
        if($preserveHierarchy)
        {
            $s3FileName = $filePath
        }
        # Load it into the root
        else
        {
            $s3FileName = Split-Path $filePath -Leaf
        }
    }
    
    # Clean up the name
    $s3FileName = $s3FileName.Replace("\","/")
    $s3FileName = $s3FileName.TrimStart(".").TrimStart("/")
    
    # Send the object to S3
    $awsClient = New-Object Amazon.S3.AmazonS3Client($awsAccessKey,$awsSecretKey)
    $fullPath = Resolve-Path $filePath
    $request = (New-Object Amazon.S3.Model.PutObjectRequest).WithBucketName($bucketName).WithAutoCloseStream($true).WithFilePath($fullPath).WithKey($s3FileName)
    
    $awsClient.PutObject($request)
   
}