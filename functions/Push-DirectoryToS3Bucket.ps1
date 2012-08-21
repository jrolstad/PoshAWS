<#
.SYNOPSIS
Pushes a directory and its children to an S3 bucket

.PARAMETER directoryPath
Path of the directory to push

.PARAMETER bucketName
Name of the bucket to push to

.PARAMETER excludeFilter
Items that should be excluded

.PARAMETER $recurse
If all the items should be loaded recursively

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS

#>
function Push-DirectoryToS3Bucket([string] $directory,
                                [string] $bucketName,
                                [string[]] $excludeFilter = $null,
                                [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                                [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey,
                                [switch] $recurse
                                )
{
    $directoryPath = Resolve-Path $directory

    $filePaths = @{}

    gci $directoryPath -recurse:$recurse -Exclude $excludeFilter | Where-Object {
            (Test-Path $_.FullName -PathType Leaf) -eq $true
        } | ForEach-Object {
                $fullPath = $_.FullName
                $name = $_.FullName.Replace($directoryPath,"").TrimStart("\")
                $filePaths.Add($name,$fullPath)
            }
            
     $filePaths.Keys | ForEach-Object {
            $key = $_
            $value = $filePaths[$key]
            Push-FileToS3Bucket -filePath $value -bucketName $bucketName -s3FileName $key -awsAccessKey $awsAccessKey -awsSecretKey $awsSecretKey
        }

}