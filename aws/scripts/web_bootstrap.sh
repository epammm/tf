#!/bin/bash
#sudo yum install -y httpd

#systemctl enable httpd
#systemctl start httpd
sudo mkdir -p /var/www/html
cat <<EOF > /var/www/html/index.html
<html>
<body>
<h1>Hello World!</h1>
<p>Instance details</p>
<p>instance id:       $(curl http://169.254.169.254/latest/meta-data/instance-id)</p>
<p>local ip:          $(curl http://169.254.169.254/latest/meta-data/local-ipv4)</p>
<p>security groups:   $(curl http://169.254.169.254/latest/meta-data/security-groups)</p>
</body>
</html>
EOF