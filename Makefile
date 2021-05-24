.PHONY: all clean serve

BUILD_CMD:=b -V

all: .docker.started
	docker exec -it jekyll jekyll ${BUILD_CMD} ${EXTRA}

.docker.started:
	docker run --rm -d -v "$(shell pwd):/srv/jekyll" -e JEKYLL_UID=$(shell id -u) --name jekyll jekyll/jekyll sleep infinity
	touch .docker.started

stop:
	- docker rm -f jekyll
	- rm .docker.started

clean:
	docker exec -it jekyll jekyll clean -V

serve:
	docker run --rm -it -v "$(shell pwd):/srv/www" -p 8000:8000 --name httpd python:slim python -m http.server --directory /srv/www/_site
