setup() {
	if [ "$(whoami)" == "root" ] && ! [ -x "$(command -v jq)" ]; then
		apt-get update
		apt-get install --no-install-recommends -y jq
	fi
}
