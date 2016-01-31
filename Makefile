################################################################################

all: base

base: base/.done

################################################################################

base/.done: base/Dockerfile
	-docker rmi raphaelmeyer/base
	docker build -t raphaelmeyer/base base
	touch $@

################################################################################

clean:
	rm -rf base/.done
	-docker rmi raphaelmeyer/base

.PHONY: clean

