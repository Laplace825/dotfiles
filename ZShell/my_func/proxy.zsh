function unset_proxy() {
	export https_proxy=""
	export http_proxy=""
	export all_proxy=""
}

function set_proxy() {
	export https_proxy="http://127.0.0.1:7897"
	export http_proxy="http://127.0.0.1:7897"
	export all_proxy="socks5://127.0.0.1:7897"
}
