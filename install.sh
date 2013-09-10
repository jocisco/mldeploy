date >> ~/vagrant_provisioned_at                                                                                                                                                
sudo yum install git -y
echo Dowloading deployment scripts
[[ -d mldeploy ]] || git clone https://github.com/jocisco/mldeploy.git
cd mldeploy
git pull
bash mldeploy
