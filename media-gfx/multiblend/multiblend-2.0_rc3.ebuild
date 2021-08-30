# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A multi-level image blender for the seamless blending of panoramic images"
HOMEPAGE="http://horman.net/multiblend/"
SRC_URI="http://horman.net/multiblend/${PN}${PV/_/}.tar.gz"
http://horman.net/multiblend/multiblend2.0rc3.tar.gz

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/libpng:0=
	media-libs/tiff:0=
	virtual/jpeg:0="
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}/src"

src_compile() {
	local libs="-ltiff -ljpeg -lpng -lpthread"
	$(tc-getCXX) ${CXXFLAGS} ${LDFLAGS} ${PN}.cpp ${libs} -o ${PN} || die
}

src_install() {
	dobin ${PN}
	dodoc changelog.txt readme.txt
}
