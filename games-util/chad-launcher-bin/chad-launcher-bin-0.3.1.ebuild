# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="Libre/Free game launcher/pirate game store for users who dislike DRM or other restrictions of freedom"
HOMEPAGE="https://gitlab.com/Gnurur/chad_launcher"
MY_PN="chad_launcher"

SRC_URI="https://gitlab.com/Gnurur/${MY_PN}/-/jobs/artifacts/${PV}/download?job=tauri:build -> ${P}_artifacts.zip
https://gitlab.com/Gnurur/${MY_PN}/-/archive/${PV}/${MY_PN}-${PV}.tar.bz2 -> ${P}.tar.bz2"

KEYWORDS="~amd64"
S="${WORKDIR}"


LICENSE="GPL-3"
SLOT="0"
IUSE=""


RDEPEND="
	net-libs/webkit-gtk
	net-misc/curl
	net-misc/wget
	dev-libs/openssl
	x11-misc/appmenu-gtk-module
	dev-libs/libappindicator
	x11-libs/gtk+:3
"

DEPEND="${RDEPEND}"



src_install() {
	dobin chad-launcher

	insinto /usr/share/applications
	doins "${MY_PN}-${PV}"/chad_launcher.desktop

	insinto /usr/share/icons/hicolor/scalable/apps
	newins "${MY_PN}-${PV}"/icon.svg chad-launcher.svg
}

pkg_postinst() {
	xdg_icon_cache_update
}
