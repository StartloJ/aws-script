#!/bin/bash

set -e

if [[ ! -v AWS_PROFILE ]]; then
    echo "[-]ERROR: Values AWS_PROFILE not set, you should export its."
    exit 1
else
    echo "[+] OK!.. AWS_PROFILE is set to: ${AWS_PROFILE}"
fi

ids=$(aws ec2 describe-instance-status | jq -r '.InstanceStatuses[].InstanceId')

# Iterate result of existed instance in loop
for id in ${ids[@]}; do
    echo "Report tags resource for $id"
    echo $(aws ec2 describe-instances --instance-ids $id | jq '.Reservations[].Instances[].Tags')
done

