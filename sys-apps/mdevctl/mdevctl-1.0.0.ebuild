# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.11.0
	anyhow-1.0.43
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	cfg-if-1.0.0
	clap-2.33.3
	env_logger-0.8.4
	fuchsia-cprng-0.1.1
	getrandom-0.2.3
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	humantime-2.1.0
	indexmap-1.7.0
	itoa-0.4.8
	lazy_static-1.4.0
	libc-0.2.101
	log-0.4.14
	memchr-2.4.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.28
	quote-1.0.9
	rand-0.4.6
	rand_core-0.3.1
	rand_core-0.4.2
	rdrand-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	ryu-1.0.5
	serde-1.0.130
	serde_json-1.0.67
	strsim-0.8.0
	structopt-0.3.22
	structopt-derive-0.4.15
	syn-1.0.75
	tempdir-0.3.7
	termcolor-1.1.2
	textwrap-0.11.0
	unicode-segmentation-1.8.0
	unicode-width-0.1.8
	unicode-xid-0.2.2
	uuid-0.8.2
	vec_map-0.8.2
	version_check-0.9.3
	wasi-0.10.2+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A mediated device management utility for Linux"
HOMEPAGE="https://github.com/mdevctl/mdevctl"
SRC_URI="
	https://github.com/mdevctl/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"
KEYWORDS="~amd64"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions Boost-1.0 ISC LGPL-2.1 MIT Unlicense"
SLOT="0"
IUSE=""

src_install() {
	default
	keepdir /etc/mdevctl.d
	insinto /lib/udev/rules.d/
	doins 60-mdevctl.rules
}