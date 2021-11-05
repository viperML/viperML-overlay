# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A dynamic tiling extension for KWin"
HOMEPAGE="https://github.com/Bismuth-Forge/bismuth"

SRC_URI="https://github.com/Bismuth-Forge/${PN}/archive/refs/tags/v${PV}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="net-libs/nodejs"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/src/kcm" # needed for automating cmake.eclass
KWINSCRIPT_SOURCEDIR="${WORKDIR}/${P}/src/kwinscript"
KWINSCRIPT_BUILDDIR="${WORKDIR}/${P}/build/kwinscript"
KWINPKG_FILE="bismuth.kwinscript"

RESTRICT="network-sandbox"

src_compile() {
	cmake_src_compile

	# Adapted from https://github.com/Bismuth-Forge/bismuth/blob/master/scripts/build.sh
	cd "${WORKDIR}/${P}"
	npm install --production esbuild@'^0.12.26'
	npx esbuild \
		--bundle "$KWINSCRIPT_SOURCEDIR/index.ts" \
		--outfile="$KWINSCRIPT_BUILDDIR/contents/code/index.mjs" \
		--format=esm \
		--platform=neutral
}

src_install() {
	cmake_src_install

	insinto /usr/share/kwin/scripts/bismuth/contents
	doins -r "$KWINSCRIPT_SOURCEDIR/ui"
	doins -r "$KWINSCRIPT_BUILDDIR/contents/code"

	insinto /usr/share/kwin/scripts/bismuth
	doins "$KWINSCRIPT_SOURCEDIR/metadata.desktop"
}

pkg_postinst() {
	elog "Enable Bismuth using Plasma Systemsettings > Window Management > KWin scripts"
}