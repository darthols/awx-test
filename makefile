.DEFAULT_GOAL = help

.PHONY: help header-env
help: ## Display help
	@grep -E '(^[0-9a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | sed -e 's/Makefile://' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-22s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
separator = "————————————————————————————————————————————————————————————————————————————————"

.PHONY: env
env: ### Install workspace env dependencies
	@echo "—————————————————————————————— PYTHON REQUIREMENTS ———————————————————————————"
	@pip3 install -U pip --no-cache-dir --quiet &&\
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} PIP3" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} PIP3"

	@pip3 install -U wheel --no-cache-dir --quiet &&\
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} WHEEL" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} WHEEL"

	@pip3 install -U setuptools --no-cache-dir --quiet &&\
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} SETUPTOOLS" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} SETUPTOOLS"

	@pip3 uninstall -y certifi --quiet &&\
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}REMOVE${Color_Off} CERTIFI" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}REMOVE${Color_Off} CERTIFI"

	@pip3 install -U --no-cache-dir -q -r requirements.txt &&\
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} PIP REQUIREMENTS" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} PIP REQUIREMENTS"

	@echo "————————————————————————————— ANSIBLE REQUIREMENTS ———————————————————————————"
	@ansible-galaxy collection install --ignore-certs -fr ${PWD}/requirements.yml && \
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} ANSIBLE GALAXY COLLECTIONS" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} ANSIBLE GALAXY COLLECTIONS"

	@ansible-galaxy role install --ignore-certs -fr ${PWD}/requirements.yml && \
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} ANSIBLE GALAXY ROLES" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} ANSIBLE GALAXY ROLES"

	@echo "————————————————————————————— CERTIFICATES ———————————————————————————————————"
	@sudo cat "/etc/pki/ca-trust/source/anchors/onet-ac-racine.pem" >> "$$(python -m certifi)" && \
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} CERTIFICAT RACINE" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} CERTIFICAT RACINE"

	@sudo cat "/etc/pki/ca-trust/source/anchors/onet-ac-secondaire.pem" >> "$$(python -m certifi)" && \
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} CERTIFICAT SECONDAIRE" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} CERTIFICAT SECONDAIRE"

	@sudo cat "/etc/pki/ca-trust/source/anchors/fra2.goskope.com.crt" >> "$$(python -m certifi)" && \
	echo "[  ${Green}OK${Color_Off}  ] ${Yellow}INSTALL${Color_Off} CERTIFICAT NETSKOPE" || \
	echo "[${Red}FAILED${Color_Off}] ${Yellow}INSTALL${Color_Off} CERTIFICAT NETSKOPE"

