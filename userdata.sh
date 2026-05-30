#!/bin/bash

# Update packages
apt update -y

# Install Apache Web Server
apt install -y apache2

# Start Apache
systemctl start apache2
systemctl enable apache2

# Create a simple web application page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Scalable Web App</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
        }

        .container {
            background: white;
            width: 60%;
            margin: auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
        }

        h1 {
            color: #2c3e50;
        }

        .info {
            margin-top: 20px;
            font-size: 18px;
            color: #555;
        }

        .success {
            color: green;
            font-size: 22px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Scalable & Highly Available Web Application</h1>

    <p class="success">
        Application Successfully Deployed Using Terraform
    </p>

    <div class="info">
        <p><b>Instance ID:</b> $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>

        <p><b>Availability Zone:</b> $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>

        <p><b>Private IP:</b> $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)</p>

        <p><b>Hostname:</b> $(hostname)</p>
    </div>
</div>

</body>
</html>
EOF

# Restart Apache
systemctl restart httpd