# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A dynamic tiling extension for KWin"
HOMEPAGE="https://github.com/Bismuth-Forge/bismuth"

SRC_URI="
	https://github.com/Bismuth-Forge/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Bismuth-Forge/${PN}/releases/download/v${PV}/binary-release.tar.gz -> ${P}-binary-artifacts.tar.gz
"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

QTMIN=5.22.5
KFMIN=5.82.0

DEPEND=""
RDEPEND="
	${DEPEND}
	>=kde-plasma/kwin-${QTMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"

S="${WORKDIR}/${P}/src/kcm"

src_install() {
	cmake_src_install

	cd "${WORKDIR}/share/kwin/scripts"
	insinto /usr/share/kwin/scripts
	doins -r bismuth
}