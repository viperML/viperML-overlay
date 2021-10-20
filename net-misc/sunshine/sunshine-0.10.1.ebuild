# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake flag-o-matic

DESCRIPTION="Sunshine is a Gamestream host for Moonlight"
HOMEPAGE="https://github.com/loki-47-6F-64/sunshine"

EGIT_REPO_URI="https://github.com/loki-47-6F-64/${PN}"

if [ "${PV}" != "9999" ]; then
	EGIT_COMMIT="v${PV}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/boost[static-libs]
	media-sound/pulseaudio
	dev-libs/openssl
	x11-libs/libXtst
	x11-libs/libXfixes
	dev-libs/libevdev
	x11-libs/libxcb
	x11-libs/libXrandr
	virtual/udev
"
RDEPEND="${DEPEND}"
BDEPEND=""

BUILD_DIR=${WORKDIR}/${P}_build

src_install() {
	cd "${BUILD_DIR}"

	dobin sunshine
}