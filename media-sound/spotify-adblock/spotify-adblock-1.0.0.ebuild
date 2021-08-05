# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

CRATES="
libc-0.2.98
proc-macro2-1.0.27
unicode-xid-0.2.2
syn-1.0.73
memchr-2.4.0
serde_derive-1.0.126
serde-1.0.126
libc-0.2.98
regex-syntax-0.6.25
lazy_static-1.4.0
aho-corasick-0.7.18
quote-1.0.9
regex-1.5.4
toml-0.5.8
"
inherit cargo

DESCRIPTION="Spotify adblocker"
HOMEPAGE="https://github.com/abba23/spotify-adblock"
SRC_URI="https://github.com/abba23/${PN}/archive/refs/tags/v${PV}.tar.gz
$(cargo_crate_uris ${CRATES})"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDDEPEND=""

src_build() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
