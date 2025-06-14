#!/bin/bash

# ✅ System update
sudo apt update -y && sudo apt upgrade -y

# ✅ Git install
sudo apt install -y git

# ✅ Java install (required by Jenkins)
sudo apt install -y fontconfig openjdk-21-jre

# ✅ Add Jenkins key & repo
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# ✅ Install Jenkins
sudo apt update -y
sudo apt install -y jenkins

# ✅ Start Jenkins
sudo systemctl enable --now jenkins

# ✅ Output admin password
echo "🔐 Jenkins Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
