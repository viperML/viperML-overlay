# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 readme.gentoo-r1

DESCRIPTION="A wallpaper plugin integrating wallpaper engine into kde wallpaper setting"
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"

EGIT_REPO_URI="https://github.com/catsout/wallpaper-engine-kde-plugin"
KEYWORDS=""

PATCHES=("${FILESDIR}/static.patch")

DISABLE_AUTOFORMATTING=yes
DOC_CONTENTS="This is just the library component for the KDE plugin.
To finalize the installation, please

- Purchase Wallpaper Engine and install it.
- Subscribe to and download some wallpapers running the application with proton or via the Steam Workshop.
- Install the KDE plugin:
  $ git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git
  $ plasmapkg2 -i wallpaper-engine-kde-plugin/plugin
- Select your wallpaper right clicking your desktop"


LICENSE="GPL-2"
SLOT="0"
IUSE=""


DEPEND="
	media-video/mpv[libmpv]
	dev-qt/qtdeclarative
"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_install() {
    default
    cmake_src_install
    readme.gentoo_create_doc
}

pkg_postinst() {
    readme.gentoo_print_elog
}
