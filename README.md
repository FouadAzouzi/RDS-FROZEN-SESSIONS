📝 Overview

Have you ever used Remote Desktop Services (RDS) and found yourself stuck in this problem?
Users try to log in, but instead of getting a new session, RDS reconnects you to a frozen or disconnected session — and you can’t do anything.
This script provides a simple on-demand solution: the user just clicks a shortcut on their desktop (CLOSE SESSION) and their frozen session is automatically closed across all RDS servers, allowing them to reconnect with a fresh session.


🔧 Configuration

Inside the script you will find a section like this:

$usuario = $env:USERNAME
$servidores = @("172.20.64.30", "172.20.64.31", "172.20.64.33", "172.20.64.34", "172.20.64.35", "172.20.64.36", "172.20.64.37")


👉 Important: replace the IP addresses in $servidores with the list of your own RDS servers.

You can use IP addresses or hostnames.

Add or remove entries depending on how many RDS servers you have in your farm.

The script will then loop through each server in this list to locate and close the user’s sessions.
