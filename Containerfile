FROM alpine:3.22

LABEL org.opencontainers.image.authors="Mike Felida" \
	org.opencontainers.image.url="https://github.com/MFelida/dev-tools" \
	org.opencontainers.image.source="https://github.com/MFelida/dev-tools"

RUN apk --update upgrade && apk add --no-cache \
	bash \
	clang20 \
	curl \
	fzf \
	git \
	lazygit \
	make \
	neovim \
	nodejs \
	npm \
	ripgrep \
	sudo

RUN npm install -g @github/copilot

VOLUME [ "/etc", "/var", "/home", "/root", "/usr", "/opt"]

ADD setup.sh /tmp/setup.sh
WORKDIR ${HOME}
ENTRYPOINT [ "bash", "/tmp/setup.sh" ]
