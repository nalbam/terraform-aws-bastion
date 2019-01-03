#!/usr/bin/env bash

# Log everything we do.
set -x
exec > /var/log/user-data.log 2>&1

hostname "${HOSTNAME}"

runuser -l ec2-user -c "curl -sL https://raw.githubusercontent.com/opsnow/kops-cui/master/tools.sh | bash"
runuser -l ec2-user -c "[ ! -d ~/kops-cui ] && git clone https://github.com/opsnow/kops-cui"
