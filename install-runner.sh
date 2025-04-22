#!/usr/bin/env bash
set -e

# Configuration variables
RUNNER_VERSION="2.317.0"
REPO_URL="https://github.com/qontahub"
RUNNER_TOKEN="$1"
RUNNER_NAME="ubuntu-24-runner-$((RANDOM % 900 + 100))"
LABELS="self-hosted,ubuntu-latest,x64"

export RUNNER_ALLOW_RUNASROOT=1


# Create and navigate to runner directory
mkdir -p /root/actions-runner && cd /root/actions-runner

# Download runner package
curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# Extract runner package
tar xzf ./actions-runner-linux-x64.tar.gz

# Configure runner
echo "Configuring runner..."
./config.sh --url "${REPO_URL}" \
		--token "${RUNNER_TOKEN}" \
		--unattended \
		--name "${RUNNER_NAME}" \
		--labels "${LABELS}"

# Install and start runner as a service
echo "Installing runner service..."
sudo ./svc.sh install
echo "Starting runner service..."
sudo ./svc.sh start

echo "GitHub Actions runner setup completed successfully."

