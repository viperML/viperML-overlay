# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="A wallpaper plugin integrating wallpaper engine into kde wallpaper setting."
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"

EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin"
KEYWORDS=""

PATCHES=(
	"${FILESDIR}/static.patch"
)


LICENSE="GPL-2"
SLOT="0"
IUSE=""


DEPEND="
	media-video/mpv[libmpv]
	dev-qt/qtdeclarative
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
