export IMAGE = node-ci-image
export TAG = latest
export NODE_VERSION = 8.10
export UBUNTU_VERSION = 16.04
export TERRAFORM_VERSION = 0.11.11

export REPO_URI="jcuffney/${IMAGE}:${TAG}"

.DEFAULT_GOAL := build

build::
	docker build \
		-t $(REPO_URI) \
		--build-arg UBUNTU_VERSION=$(UBUNTU_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		--build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		.;

push::
	docker push $(REPO_URI)

run::
	docker run \
		-ti \
		--rm \
		-v /var/run/docker.sock:/var/run/docker.sock \
		$(REPO_URI);