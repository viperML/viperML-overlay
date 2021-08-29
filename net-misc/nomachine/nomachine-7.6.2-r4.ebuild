# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://download.nomachine.com/download/7.6/Linux/nomachine_7.6.2_4_x86_64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="${RDEPEND}"
RDEPEND="
sys-apps/nawk
net-misc/openssh
x11-apps/xauth
"
BDEPEND=""

S="${WORKDIR}/NX/etc/NX/server/packages"

src_unpack() {
	default
	tar xfzv "${S}/nxserver.tar.gz" --directory="${S}"
}


src_install() {
	dobin NX/bin/nxserver
	rm -rf NX/bin

	insinto /etc/NX
	doins -r NX/etc/*
	rm -rf NX/etc

	insinto /opt
	doins -r NX
}
