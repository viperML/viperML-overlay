# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools eutils

DESCRIPTION="Modern graphical system monitor for any panel"
HOMEPAGE="https://github.com/udda/multiload-ng"

LICENSE="GPL-2"
SLOT="0"
IUSE="-debug +autostart -indicator -lxde -mate -standalone +systray -xfce4"

GIT_HASH="743885da84474bfffc5f5505c0d1a7160de6afef"
SRC_URI="https://github.com/udda/${PN}/archive/${GIT_HASH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GIT_HASH}"

KEYWORDS="~amd64"

RDEPEND="
	x11-libs/gtk+:3
	x11-libs/cairo:=
	indicator? ( >=dev-libs/libappindicator-0.4.92:3 )
	lxde? ( >=lxde-base/lxpanel-0.5.8 )
	mate? ( >=mate-base/mate-panel-1.7.0 )
	xfce4? (
		>=xfce-base/libxfce4util-4.12.0
		>=xfce-base/xfce4-panel-4.12.0
	)"

DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

DOCS="AUTHORS README.md"

REQUIRED_USE="
	|| ( indicator lxde mate standalone systray xfce4 )
"

src_prepare() {
	eautoreconf
	eapply_user
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable autostart) \
		$(use_with standalone) \
		$(use_with indicator) \
		$(use_with lxde lxpanel) \
		$(use_with mate) \
		$(use_with systray) \
		$(use_with xfce4) \
		--with-gtk=3.0 --disable-deprecations
}