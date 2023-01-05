## Architecture Diagram:


## Description:
Creating and configuring an elastic, highly available single tier AWS Architecture

## Architecture Essentials:
* 1 VPC (Regional so one needed)
* 4 Subnets (2 pubic, 2 Private in 2 availability zones)
* Autoscaling group. ASG
* Application Load Balancer. ALB (cordinates the traffic to the ASG)
* Instances with no assigned Public Ipv4.
* Security Groups. SG
 * instances SG should allow inbound traffic from HTTP from ALB
 * ALB SG should allow inbound traffic from HTTP frpm anywhere (0.0.0.0/0)
