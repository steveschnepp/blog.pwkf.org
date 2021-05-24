.PHONY: all clean serve

all: .start
	docker exec -it jekyll jekyll b -V

.start:
	docker run --rm -d -v "$(shell pwd):/srv/jekyll" -e JEKYLL_UID=$(shell id -u) --name jekyll jekyll/jekyll tail -f /dev/null
	touch .start

stop:
	- docker rm -f jekyll
	- rm .start

clean:
	docker exec -it jekyll jekyll clean -V

serve:
	docker run --rm -it -v "$(shell pwd):/srv/www" -p 8000:8000 --name httpd python:slim python -m http.server --directory /srv/www/_site
