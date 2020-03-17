#!/bin/sh
sudo wget https://github.com/nginxinc/nginx-asg-sync/releases/download/v0.4-1/nginx-asg-sync-0.4-1.amzn2.x86_64.rpm
sudo yum install nginx-asg-sync-0.4-1.amzn2.x86_64.rpm -y
sudo rm nginx-asg-sync-0.4-1.amzn2.x86_64.rpm

sudo nginx -s reload

cat > /tmp/config.yaml <<EOF
region: eu-west-2
api_endpoint: http://127.0.0.1:8080/api
sync_interval_in_seconds: 1
cloud_provider: AWS
upstreams:
  - name: app_one
    autoscaling_group: ngx-oss-one-autoscaling
    port: 443
    kind: stream
    max_conns: 0
    max_fails: 1
    fail_timeout: 10s
    slow_start: 0s
  - name: app_two
    autoscaling_group: ngx-oss-two-autoscaling
    port: 443
    kind: stream
    max_conns: 0
    max_fails: 1
    fail_timeout: 10s
    slow_start: 0s
EOF

sudo mv /tmp/config.yaml /etc/nginx/config.yaml
sudo systemctl enable nginx-asg-sync
