#!/usr/bin/env bash

export CLI_VERSION="9.7.0"
export VERSION="1.0"
echo "Version = ${VERSION}"

cd artifacts/sql
zip -r ../sql.zip ./*

cd ../webContent
zip -r ../PetPortal_pages.zip ./*

cd ../petclinic-war
zip -r ../petclinic-ear/petclinic.war ./*

cd ../petclinic-ear
zip -r ../PetClinic.ear ./*

cd ../..
if [ ! -z "${GET_LOCAL}" ]
then
  GITHUB_RUN_NUMBER="0"
  xl apply --file PetPortal.yaml --values version=${VERSION}-${GITHUB_RUN_NUMBER}
else
  curl -LO https://dist.xebialabs.com/public/xl-cli/$CLI_VERSION/linux-amd64/xl
  chmod +x xl
  ./xl apply --xl-deploy-url=$XLD_URL --xl-deploy-username=$XLD_USER --xl-deploy-password=$XLD_PASSWD --file PetPortal.yaml --values version=${VERSION}-${GITHUB_RUN_NUMBER}
fi
rm artifacts/PetPortal_pages.zip
rm artifacts/sql.zip
if [ -z "${GET_LOCAL}" ]
then
  rm xl
fi
