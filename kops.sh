#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#export KOPS_STATE_STORE=s3://manideep.flm.k8s
#source .bashrc


#! /bin/bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kop

# Download AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Install unzip if not present
sudo yum install -y unzip

# Unzip the installer
unzip awscliv2.zip

# Run the installer
sudo ./aws/install

# Verify installation
aws --version


kops create cluster --name manideep.k8s.local --zones us-east-1a,us-east-1b,us-east-1c --master-count=1 --master-size t2.medium --master-volume-size 25 --node-count=2 --node-size t2.micro --node-volume-size 25
kops update cluster --name manideep.k8s.local --yes --admin
