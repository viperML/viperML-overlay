# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 xdg-utils

DESCRIPTION="An extremely low latency KVMFR (KVM FrameRelay) implementation"
HOMEPAGE="https://looking-glass.io https://github.com/gnif/LookingGlass"
EGIT_REPO_URI="https://github.com/gnif/LookingGlass"
EGIT_COMMIT="B4"

S="${WORKDIR}/${P}/client"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/libconfig:0=
	dev-libs/nettle:=[gmp]
	media-libs/freetype:2
	media-libs/fontconfig:1.0
	media-libs/libsdl2
	media-libs/sdl2-ttf
	virtual/glu"
DEPEND="${RDEPEND}
	app-emulation/spice-protocol"
BDEPEND="virtual/pkgconfig"


src_install() {
	cmake_src_install

	cd "${WORKDIR}/${P}/resources"
	insinto /usr/share/icons/hicolor/128x128/apps
	newins icon-128x128.png looking-glass.png

	echo "[Desktop Entry]
Type=Application
Terminal=false
Exec=/usr/bin/looking-glass-client -m 58
Name=Looking Glass
Icon=looking-glass" | tee looking-glass.desktop

	insinto /usr/share/applications
	doins looking-glass.desktop

	elog "Installed .desktop file for your convenience. Default behaviour is CapsLock as modifier key."
}

pkg_postinst() {
	xdg_icon_cache_update
}