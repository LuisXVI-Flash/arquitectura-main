echo "Detener los contenedores"
docker stop $(docker ps -a -q)

echo "Iniciando el entorno"
export DOCKER_APP_PATH="$(pwd)/arquitectura-docker"
export FE_APP_PATH="$(pwd)/arquitectura-frontend"
export BE_APP_PATH="$(pwd)/arquitectura-backend"

echo "Instalando dependencias"
npm install --prefix ${FE_APP_PATH} --force
npm install --prefix ${BE_APP_PATH}

COMPOSE_HTTP_TIMEOUT=200 docker-compose -f ./arquitectura-docker/docker-compose.yml up