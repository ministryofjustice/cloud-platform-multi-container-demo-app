TEAM_NAME := jason-lab
REPO_NAME := multi-container-ruby
VERSION := 1.15

COMPONENTS := rails-app content-api worker
ECR := 754256621582.dkr.ecr.eu-west-2.amazonaws.com/$(TEAM_NAME)/$(REPO_NAME)

build-images:
	for component in $(COMPONENTS); do \
		( cd $${component}; docker build -t $(TEAM_NAME)/$(REPO_NAME):$${component} . ); \
	done

tag-images:
	for component in $(COMPONENTS); do \
		docker tag $(TEAM_NAME)/$(REPO_NAME):$${component} $(ECR):$${component}-$(VERSION); \
	done

push-images:
	for component in $(COMPONENTS); do \
		docker push $(ECR):$${component}-$(VERSION); \
	done

build-tag-and-push:
	make build-images
	make tag-images
	make push-images
