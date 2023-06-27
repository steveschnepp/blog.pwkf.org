.PHONY: all clean serve

BUILD_CMD:=b -V

all:
	jekyll build -VI

drafts:
	jekyll build -VID

clean:
	jekyll clean -V
