TEAM_NAME := ministryofjustice
REPO_NAME := cloud-platform-multi-container-demo-app
VERSION := 1.4

COMPONENTS := rails-app content-api worker

build-images:
	for component in $(COMPONENTS); do \
		( cd $${component}; docker build -t $(TEAM_NAME)/$(REPO_NAME):$${component} . ); \
	done

tag-images:
	for component in $(COMPONENTS); do \
		docker tag $(TEAM_NAME)/$(REPO_NAME):$${component} $(TEAM_NAME)/$(REPO_NAME):$${component}-$(VERSION); \
	done

push-images:
	for component in $(COMPONENTS); do \
		docker push $(TEAM_NAME)/$(REPO_NAME):$${component}-$(VERSION); \
	done

build-tag-and-push:
	make build-images
	make tag-images
	make push-images
