$(eval $(call defw,NS,istvano))
$(eval $(call defw,REPO,nginx-modsecurity))
$(eval $(call defw,VERSION,latest))
$(eval $(call defw,NAME,nginx-modsecurity))
$(eval $(call defw,REGISTRY_HOST,docker.io))

.PHONY: build
build:: ##@Docker Build an image
	docker build --pull -t $(NS)/$(REPO):$(VERSION) .

.PHONY: ship
ship:: ##@Docker Ship the image (build, ship)
ship:: build
	docker push $(NS)/$(REPO):$(VERSION)

.PHONY: run
run:: ##@Docker Run a container (build, run attached)
run:: build
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENVS) $(NS)/$(REPO):$(VERSION)

.PHONY: start
start:: ##@Docker Run a container (build, run detached)
start:: build start
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENVS) $(NS)/$(REPO):$(VERSION)

.PHONY: stop
stop:: ##@Docker Stop the running container
	docker stop $(NAME)
    
.PHONY: clean
clean:: ##@Docker Remove the container
	docker rm -f $(NAME)

.PHONY: release
release:: ##@Docker Build and Ship
release:: build ship