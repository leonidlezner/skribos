CONTAINER_VERSION=`cat VERSION`

build:
	docker build --tag leonidlezner/skribos:$(CONTAINER_VERSION) .

publish:
	docker push leonidlezner/skribos:$(CONTAINER_VERSION)
	#docker tag leonidlezner/skribos:$(CONTAINER_VERSION) docker.pkg.github.com/leonidlezner/skribos/skribos:latest
	#docker push docker.pkg.github.com/leonidlezner/skribos/skribos:latest

remove:
	docker rmi leonidlezner/skribos:$(CONTAINER_VERSION) --force

latest:
	docker tag leonidlezner/skribos:$(CONTAINER_VERSION) leonidlezner/skribos:latest
	docker push leonidlezner/skribos:latest

shell:
	docker run -it --entrypoint "/bin/bash" --volume "$(pwd):/data" leonidlezner/skribos:$(CONTAINER_VERSION)