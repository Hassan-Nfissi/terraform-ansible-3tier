#!/bin/bash
terraform output -raw frontend_ip > ip_frontend.txt
terraform output -raw backend_ip > ip_backend.txt
terraform output -raw database_ip > ip_db.txt

echo "[frontend]" > ../ansible/inventory.ini
echo "$(cat ip_frontend.txt) ansible_user=azureuser" >> ../ansible/inventory.ini

echo "[backend]" >> ../ansible/inventory.ini
echo "$(cat ip_backend.txt) ansible_user=azureuser" >> ../ansible/inventory.ini

echo "[db]" >> ../ansible/inventory.ini
echo "$(cat ip_db.txt) ansible_user=azureuser" >> ../ansible/inventory.ini
