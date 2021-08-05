#!/usr/bin/env bash
sts_token=$(aws sts get-session-token --serial-number arn:aws:iam::966891400085:mfa/rajeshmi@google.com --output  text  --profile rajesh --token-code $1)
ACCESS=$(echo $sts_token  | awk '{print $2}')
SECRET=$(echo $sts_token  | awk '{print $4}')
SESSION=$(echo  $sts_token| awk '{print $5}')

echo  $ACCESS
echo $SECRET
echo $SESSION

sed -ie "7s|.*|aws_access_key_id = $ACCESS|" ~/.aws/credentials
sed -ie "8s|.*|aws_secret_access_key = $SECRET|" ~/.aws/credentials
sed -ie "9s|.*|aws_session_token = $SESSION|" ~/.aws/credentials

