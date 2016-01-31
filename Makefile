################################################################################

all: base

base: base/.done
release: base-release

################################################################################

base/.done: base/Dockerfile
	-docker rmi raphaelmeyer/base
	docker build -t raphaelmeyer/base base
	touch $@

################################################################################

base-release: check-tag base
	docker tag raphaelmeyer/base raphaelmeyer/base:$(tag)
	docker push raphaelmeyer/base:$(tag)

check-tag:
ifndef tag
	$(error "Must specify a tag with make release tag=TAG")
endif

################################################################################

clean:
	rm -rf base/.done
	-docker rmi raphaelmeyer/base

.PHONY: clean

