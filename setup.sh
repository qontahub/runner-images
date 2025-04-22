#!/usr/bin/env bash
set -e

mkdir -p /imagegeneration/installers

export HELPER_SCRIPTS=/root/runner-images/images/ubuntu/scripts/helpers
export DEBIAN_FRONTEND=noninteractive
export IMAGE_FOLDER=/imagegeneration
export IMAGEDATA_FILE=/imagegeneration/imagedata.json
export INSTALLER_SCRIPT_FOLDER=/imagegeneration/installers
chmod 777 ./images/ubuntu
chmod +x ./images/ubuntu/scripts/build/*

BASE_PATH=./images/ubuntu
$BASE_PATH/scripts/build/install-ms-repos.sh
$BASE_PATH/scripts/build/configure-apt-sources.sh
$BASE_PATH/scripts/build/configure-apt.sh
$BASE_PATH/scripts/build/configure-limits.sh

$BASE_PATH/scripts/build/configure-environment.sh
cp -r $BASE_PATH/scripts/tests $IMAGE_FOLDER
cp -r $BASE_PATH/scripts/helpers $IMAGE_FOLDER
cp -r $BASE_PATH/scripts/build $IMAGE_FOLDER

cp $BASE_PATH/toolsets/toolset-2404.json $INSTALLER_SCRIPT_FOLDER/toolset.json

$BASE_PATH/scripts/build/install-apt-vital.sh
$BASE_PATH/scripts/build/install-powershell.sh
pwsh -f $BASE_PATH/scripts/build/Install-PowerShellModules.ps1
pwsh -f $BASE_PATH/scripts/build/Install-PowerShellAzModules.ps1

$BASE_PATH/scripts/build/install-actions-cache.sh
$BASE_PATH/scripts/build/install-runner-package.sh
$BASE_PATH/scripts/build/install-apt-common.sh
$BASE_PATH/scripts/build/install-container-tools.sh
$BASE_PATH/scripts/build/install-dotnetcore-sdk.sh

$BASE_PATH/scripts/build/install-git.sh
$BASE_PATH/scripts/build/install-git-lfs.sh
$BASE_PATH/scripts/build/install-github-cli.sh
$BASE_PATH/scripts/build/install-google-cloud-cli.sh
$BASE_PATH/scripts/build/install-java-tools.sh
$BASE_PATH/scripts/build/install-nvm.sh
$BASE_PATH/scripts/build/install-nodejs.sh
$BASE_PATH/scripts/build/install-rust.sh
$BASE_PATH/scripts/build/install-vcpkg.sh
$BASE_PATH/scripts/build/configure-dpkg.sh
$BASE_PATH/scripts/build/install-yq.sh
$BASE_PATH/scripts/build/install-pypy.sh
$BASE_PATH/scripts/build/install-python.sh

$BASE_PATH/scripts/build/install-docker.sh
