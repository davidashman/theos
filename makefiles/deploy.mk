beta::
	@if [ -z "$(_THEOS_PACKAGE_LAST_FILENAME)" ]; then \
		echo "$(MAKE) beta requires that you build a package before you try to install it." >&2; \
		exit 1; \
	fi
	@if [ ! -f "$(_THEOS_PACKAGE_LAST_FILENAME)" ]; then \
		echo "Could not find \"$(_THEOS_PACKAGE_LAST_FILENAME)\" to deploy. Aborting." >&2; \
		exit 1; \
	fi
	scp "$(_THEOS_PACKAGE_LAST_FILENAME)" linode:/home/david/repos/beta/debs/.
	ssh linode "cd /home/david/repos/beta && dpkg-scanpackages . /dev/null | bzip2 > Packages.bz2"
