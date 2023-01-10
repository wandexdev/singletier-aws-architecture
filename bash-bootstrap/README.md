# BASH SCRIPT AS EC2 USER DATA: [link](https://github.com/wandexdev/singletier-aws-architecture/blob/main/bash-bootstrap/ec2_userdatascript.sh)
It outputs the page served via NGINX from both private ec2 instances passed through the application load balancer.
![EC2 User data used](ec2script.png)

---
## A
	* This bash script intalls, builds and deploys a Python_Flask app with all dependies needed to run efficiently.
	* It also installs and configures NGINX to serve the app.
	* The simple python_Flask app diplays hosname and ip address of the server its listening to.

### Sample proof on Browser:
![wandexdev sample](python-flask.png)

### Limitation:
As painfully as I finally admit this, I couldnt use this script to automatically create instnaces in my private subnets. It worked perfectly for public instances due to their pubic IPv4 addresses but not the private ones.
......Ill definetely do more research.

## B (FAILED)
	* This bash script automatically configures 'n' numbers of ec2 instances to install, configure and set nginx to display hostname in an inlined styled html file. 

### Sample Proof on Browser:
![html user data](htmluserdata.png)

### Limitation:
Well it failed to show the hostname as it kept returning the `$(Hostname -f) as a normal string.
