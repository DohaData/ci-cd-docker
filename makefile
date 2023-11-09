include ../../../make.inc


build_docker_image:
	- docker build -t "${DOCKER_IMAGE_NAME}:latest" .

run_docker_image:
	- docker run -p ${PORT}:${PORT} -e PORT=${PORT} "${DOCKER_IMAGE_NAME}:latest"

push_docker_image:
	- docker tag "${DOCKER_IMAGE_NAME}:latest" "europe-west1-docker.pkg.dev/wagon-bootcamp-402010/docker-hub/${DOCKER_IMAGE_NAME}:latest"
	- docker push "europe-west1-docker.pkg.dev/wagon-bootcamp-402010/docker-hub/${DOCKER_IMAGE_NAME}:latest"

deploy_docker_image:
	- gcloud run deploy "${DOCKER_IMAGE_NAME}" \
--image "europe-west1-docker.pkg.dev/wagon-bootcamp-402010/docker-hub/${DOCKER_IMAGE_NAME}:latest" \
--region=europe-west1 \
--allow-unauthenticated
# https://fast-fnoyvuub2q-ew.a.run.app/
