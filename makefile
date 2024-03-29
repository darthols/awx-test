.PHONY: env
env-desc = "Setup local dev env"
env:
	@echo "==> $(env-desc)"

	@[ -d "${PWD}/.direnv" ] || (echo "Venv not found: ${PWD}/.direnv" && exit 1)
	@pip3 install -U pip wheel setuptools --no-cache-dir && \
	echo "[  OK  ] PIP + WHEEL + SETUPTOOLS" || \
	echo "[FAILED] PIP + WHEEL + SETUPTOOLS"

	@pip3 install -U --no-cache-dir -r "${PWD}/requirements.txt" && \
	echo "[  OK  ] PIP REQUIREMENTS" || \
	echo "[FAILED] PIP REQUIREMENTS"
	
	@ansible-galaxy install -fr "${PWD}/requirements.yml" && \
	echo "[  OK  ] ANSIBLE-GALAXY REQUIREMENTS" || \
	echo "[FAILED] ANSIBLE-GALAXY REQUIREMENTS"

	@sudo cat "/etc/pki/ca-trust/source/anchors/onet-ac-racine.pem" >> "$$(python -m certifi)" && \
	echo "[  OK  ] CERTIFICAT RACINE" || \
	echo "[FAILED] CERTIFICAT RACINE"

	@sudo cat "/etc/pki/ca-trust/source/anchors/onet-ac-secondaire.pem" >> "$$(python -m certifi)" && \
	echo "[  OK  ] CERTIFICAT SECONDAIRE" || \
	echo "[FAILED] CERTIFICAT SECONDAIRE"
