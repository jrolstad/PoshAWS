<#
.SYNOPSIS
Starts a new EC2 instance

.PARAMETER imageId
ImageId to create the instance with

.PARAMETER instanceType
Type of instance to create (micro, small, medium, etc)

.PARAMETER securityGroup
Security Group  to use for the instance

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS

#>
function Start-EC2Instance([string] $imageId,
                        [string] $instanceType,
                        [string[]] $securityGroup,
                        [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                        [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                            )
{
     $awsClient = New-Object Amazon.EC2.AmazonEC2Client($awsAccessKey,$awsSecretKey)
     
     $request = (New-Object Amazon.EC2.Model.RunInstancesRequest).WithImageId($imageId).WithInstanceType($instanceType).WithSecurityGroup($securityGroup).WithMinCount(1).WithMaxCount(1)
     
     $awsClient.RunInstances($request);
}