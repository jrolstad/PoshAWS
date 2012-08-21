<#
.SYNOPSIS
Terminates the given EC2 instance

.PARAMETER instanceId
Identifier of the instance to stop

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS

#>
function Stop-EC2Instance([string[]] $instanceId,
                        [string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                        [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey
                            )
{
     $awsClient = New-Object Amazon.EC2.AmazonEC2Client($awsAccessKey,$awsSecretKey)
     
     $request = (New-Object Amazon.EC2.Model.TerminateInstancesRequest).WithInstanceId($instanceId)
     
     $awsClient.TerminateInstances($request);
}