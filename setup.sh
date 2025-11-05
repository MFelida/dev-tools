#/usr/bin/env bash

if [ -z "${USER}" ] || [ -z "${UID}" ]; then
	echo "USER or UID variable is not set"
	exit 2
fi

export USER
export HOME="/home/${USER}"

if ! grep -q ${USER} /etc/passwd; then
	adduser -h ${HOME} -u ${UID} -s "/bin/bash" ${USER}
	git clone https://github.com/MFelida/dotfiles ${HOME}/.dotfiles
	chown -R ${USER}:${USER} ${HOME}/.dotfiles
	sudo -u ${USER} ${HOME}/.dotfiles/setup.sh
fi

cd ${HOME}
exec tail -f /dev/null
