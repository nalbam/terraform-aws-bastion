#!/usr/bin/env bash

# Log everything we do.
set -x
exec > /var/log/user-data.log 2>&1

hostname "${HOSTNAME}"

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

curl -slo /etc/motd "https://raw.githubusercontent.com/opsnow-tools/caution/master/motd"

runuser -l ec2-user -c "curl -sL https://raw.githubusercontent.com/opsnow/kops-cui/master/tools.sh | bash"
runuser -l ec2-user -c "[ -d ~/kops-cui ] || git clone https://github.com/opsnow/kops-cui"
