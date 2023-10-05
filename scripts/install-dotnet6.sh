# @see: https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#supported-distributions

# Get Ubuntu version
repo_version=$(lsb_release -r -s)

if [ -z ${repo_version} ]; then
    echo "Could not resolve the repository version"
    exit 1;
fi

echo "Using repository version: ${repo_version}"

# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/$repo_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

# Install Microsoft signing key and repository
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb

# Update packages
sudo apt update

# Install dotnet v6
sudo apt-get install dotnet-sdk-6.0
