.PHONY: all clean serve

all: .start
	docker exec -it jekyll jekyll b -V

.start:
	docker run --rm -d -v "$(shell pwd):/srv/jekyll" -e JEKYLL_UID=$(shell id -u) -p 4000 --name jekyll jekyll/jekyll tail -f /dev/null
	touch .start

stop:
	docker rm -f jekyll
	rm .start

clean:
	docker exec -it jekyll jekyll clean -V

serve:
	docker run --rm -it -v "$(shell pwd):/srv/www" --name httpd busybox:musl httpd -vvf -p 8000 -u $(shell id -u) -h /srv/www/_site
