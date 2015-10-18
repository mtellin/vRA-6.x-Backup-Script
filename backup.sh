# You must setup sudoers 
# Refer to VMware KB 2084085 for additional information on files to backup

mkdir ~/`date +%Y-%m-%d`-vRA-Backup
/opt/vmware/vpostgres/9.2/bin/pg_dump -U vcac vcac -f ~/`date +%Y-%m-%d`-vRA-Backup/`date +%Y-%m-%d`-automate.txt
cp /etc/vcac/encryption.key ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vcac/vcac.keystore ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vcac/vcac.properties ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vcac/security.properties ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vcac/server.xml ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vcac/solution-users.properties ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/apache2/server.pem ~/`date +%Y-%m-%d`-vRA-Backup/
sudo cp /etc/vco/app-server/sso.properties ~/`date +%Y-%m-%d`-vRA-Backup/
cp /etc/vco/app-server/vmo.properties ~/`date +%Y-%m-%d`-vRA-Backup/

# Replace with your storage and path to mount
sudo mount -t nfs -o nolock {storage}:{path to mount} /mnt

sudo tar -czvf ~/`date +%Y-%m-%d`-vRA-Backup.tar.gz ~/`date +%Y-%m-%d`-vRA-Backup/
sudo mv ~/`date +%Y-%m-%d`-vRA-Backup.tar.gz /mnt
rm -Rf ~/`date +%Y-%m-%d`-*
sudo umount /mnt
