# BASH SCRIPT AS EC2 USER DATA
	* This bash script intalls, builds and deploys a Python_Flask app with all dependies needed to run efficiently.
	* It also installs and configures NGINX to serve the app.
	* The simple python_Flask app diplays hosname and ip address of the server its listening to.

# Sample proof on Browser:
![wandexdev sample](python-flask.png)

# Limitation:
As painfully as I finally admit this, I couldnt use this script to automatically create instnaces in my private subnets. It worked perfectly for public instances due to their pubic IPv4 addresses but not the private ones.
......Ill definetely do more research.
