function UnsetProxy() {
	export https_proxy=""
	export http_proxy=""
	export all_proxy=""
}

function SetProxy() {
	export https_proxy="http://127.0.0.1:7897"
	export http_proxy="http://127.0.0.1:7897"
	export all_proxy="socks5://127.0.0.1:7897"
}
