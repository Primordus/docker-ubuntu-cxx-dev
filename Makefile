DOCKER_REPO=primordus/ubuntu-c-cxx-dev

.PHONY: build push

build:
	sudo docker build -f Dockerfile .
	sudo docker build -t ${DOCKER_REPO} .

push: build
	sudo docker login
	sudo docker push ${DOCKER_REPO} .

