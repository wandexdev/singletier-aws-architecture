## Architecture Diagram:


## Description:
Creating and configuring an elastic, highly available single tier AWS Architecture

## Architecture Essentials (Network and Servers):
* 1 Virtual Private Cloud[VPC] (Regional so one needed)
* 4 Subnets (2 pubic, 2 Private in 2 availability zones)
* Autoscaling group[ASG]
	* Target group for the instances
* Application Load Balancer[ALB] (cordinates the traffic to the ASG)
* Instances with no assigned Public Ipv4, just normal Private ones.
* Network Address Translator[NAT] Gateway or Instance (Provides 1 public IPv4 for all Private instances in order to allow internet requests flow to them)
* Route Tables
* Security Groups[SG]
	* instances SG should allow inbound traffic from HTTP from ALB
	* ALB SG should allow inbound traffic from HTTP frpm anywhere (0.0.0.0/0)
