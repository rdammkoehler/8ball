#!/usr/bin/env bash
set -ex
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd ${DIR}/..

NAME=8ball
VERSION=$(cat setup.py | grep "^VERSION" | awk '{ print $3}' | tr \' ' ')
VERSION="${VERSION//[[:space:]]/}"
WHEEL_FILE="8ball-${VERSION}-py3-none-any.whl"
source venv/bin/activate

# Create the wheel file to upload to nexus pypi
rm -f dist/$WHEEL_FILE
./setup.py bdist_wheel
twine upload --repository-url http://localhost:8081/repository/mypypi-local/ dist/$WHEEL_FILE

# build the docker image using nexus pypi
nexus_server_docker_ip=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' nexus`
docker build --add-host=nexus:$nexus_server_docker_ip --tag localhost:18000/$NAME:${VERSION} --build-arg WHEEL_VERSION=${VERSION} --file Dockerfile .
docker tag localhost:18000/$NAME:${VERSION} localhost:18000/$NAME:latest

# push the docker image to nexus docker image repo
docker push localhost:18000/$NAME:$VERSION
docker push localhost:18000/$NAME:latest

cd ${DIR}