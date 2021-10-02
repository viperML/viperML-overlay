# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 flag-o-matic

DESCRIPTION="A wallpaper plugin integrating wallpaper engine into kde wallpaper setting."
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"

EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin"
KEYWORDS=""


LICENSE="GPL-2"
SLOT="0"
IUSE=""


DEPEND="
	media-video/mpv[libmpv]
	dev-qt/qtdeclarative
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"


# src_configure() {
#  	cmake_src_configure
# }
#
# src_install() {
# 	cmake_src_install
# }
