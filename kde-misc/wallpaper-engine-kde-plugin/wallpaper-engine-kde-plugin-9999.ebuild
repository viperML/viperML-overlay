# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A wallpaper plugin integrating wallpaper engine into kde wallpaper setting"
HOMEPAGE="https://github.com/catsout/wallpaper-engine-kde-plugin"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/catsout/${PN}"
else
	SRC_URI="https://github.com/catsout/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

PATCHES=("${FILESDIR}/static.patch")

LICENSE="GPL-2"
SLOT="0"
IUSE="-webengine"

DEPEND="
	media-video/mpv[libmpv]
	dev-qt/qtmultimedia[gstreamer]
	dev-qt/qtdeclarative
"
RDEPEND="${DEPEND}
	dev-qt/qtwebsockets
	dev-qt/qtwebchannel
	dev-python/websockets
	webengine? ( dev-qt/qtwebengine )
"

src_install() {
	cmake_src_install

	insinto /usr/share/plasma/wallpapers/com.github.casout.wallpaperEngineKde
	doins -r plugin/*
}

pkg_postinst() {
	elog "To load wallpapers, install Wallpaper Engine with Steam and subscribe to some wallpapers"
	ewarn "If you encounter any problems that lock you out of Plasma, you can disable this extension with:"
	ewarn "$ sed -i '/WallpaperFilePath/d' ~/.config/plasma-org.kde.plasma.desktop-appletsrc"
}