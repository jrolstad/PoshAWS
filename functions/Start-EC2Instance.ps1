function Start-EC2Instance([string] $imageId,
                        [string] $instanceType = $PoshAws.Preferences.DefaultEC2InstanceType,
                        [string[]] $securityGroup = $PoshAws.Preferences.DefaultEC2SecurityGroup,
                        [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                        [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                            )
{
     $awsClient = New-Object Amazon.EC2.AmazonEC2Client($awsAccessKey,$awsSecretKey)
     
     $request = (New-Object Amazon.EC2.Model.RunInstancesRequest).WithImageId($imageId).WithInstanceType($instanceType).WithSecurityGroup($securityGroup).WithMinCount(1).WithMaxCount(1)
     
     $awsClient.RunInstances($request);
}