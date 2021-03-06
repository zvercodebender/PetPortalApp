#!/usr/bin/env bash

export CLI_VERSION="9.7.0"
export VERSION="3.0"
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
  xl apply --file PetPortal.yaml --values version=${GITHUB_RUN_NUMBER}.0
else
  curl -LO https://dist.xebialabs.com/public/xl-cli/$CLI_VERSION/linux-amd64/xl
  chmod +x xl
  ./xl apply --xl-deploy-url=$XLD_URL --xl-deploy-username=$XLD_USER --xl-deploy-password=$XLD_PASSWD --file PetPortal.yaml --values version=${GITHUB_RUN_NUMBER}.0
fi
rm artifacts/PetPortal_pages.zip
rm artifacts/sql.zip
rm artifacts/PetClinic.ear
rm artifacts/petclinic-ear/petclinic.war
if [ -z "${GET_LOCAL}" ]
then
  rm xl
fi
