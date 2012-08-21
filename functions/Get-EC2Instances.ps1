<#
.SYNOPSIS
Obtains all running EC2 instances

.PARAMETER awsAccessKey
Access key for AWS

.PARAMETER awsSecretkey
Secret Key for AWS

#>
function Get-EC2Instances([string] $awsAccessKey = $PoshAws.Preferences.AwsAccessKey,
                        [string] $awsSecretKey = $PoshAWS.Preferences.AwsSecretKey)
{
     $awsClient = New-Object Amazon.EC2.AmazonEC2Client($awsAccessKey,$awsSecretKey)
     
     $request = (New-Object Amazon.EC2.Model.DescribeInstancesRequest)
     
     $response = $awsClient.DescribeInstances($request);
     
     [xml] $data = $response.DescribeInstancesResult
     
     $reservations = $data.DescribeInstancesResult.Reservation
     
     foreach($reservation in $reservations)
     {
        $reservation.RunningInstance
     }
}