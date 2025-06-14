#!/bin/bash

# ✅ System update
sudo apt update -y && sudo apt upgrade -y

# ✅ Git install
sudo apt install -y git

# ✅ System update
sudo apt update -y && sudo apt upgrade -y


# ✅ Java install (Jenkins requires Java)
sudo apt install -y fontconfig openjdk-21-jre

# ✅ Add Jenkins GPG key and repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# ✅ Jenkins install
sudo apt update -y
sudo apt install -y jenkins

# ✅ Enable & start Jenkins
sudo systemctl enable --now jenkins

# ✅ Show Jenkins initial admin password
echo "🔐 Jenkins Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
