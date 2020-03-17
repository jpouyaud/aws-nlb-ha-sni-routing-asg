cd terraform \
&& terraform init \
&& yes yes | terraform destroy \
&& rm -rf .terraform terraform.* \
&& aws ec2 deregister-image --region eu-west-3 --image-id $(aws ec2 describe-images --filters "Name=tag:Name,Values=ngx-plus" --region eu-west-3 --query "Images[].ImageId" --output text) \
&& aws ec2 deregister-image --region eu-west-3 --image-id $(aws ec2 describe-images --filters "Name=tag:Name,Values=ngx-oss" --region eu-west-3 --query "Images[].ImageId" --output text) \
&& aws ec2 delete-snapshot --region eu-west-3 --snapshot-id $(aws ec2 describe-snapshots --filters "Name=tag:Name,Values=ngx-plus" --region eu-west-3 --query "Snapshots[].SnapshotId" --output text) \
&& aws ec2 delete-snapshot --region eu-west-3 --snapshot-id $(aws ec2 describe-snapshots --filters "Name=tag:Name,Values=ngx-oss" --region eu-west-3 --query "Snapshots[].SnapshotId" --output text) \
&& rm ../packer/setup-instance.sh
