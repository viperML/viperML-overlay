# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="A complete solution for viewing and editing PDF files"
HOMEPAGE="https://code-industry.net/free-pdf-editor/"
SRC_URI="https://code-industry.net/public/${P}_qt5.amd64.tar.gz"

LICENSE="master-pdf-editor"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	dev-libs/nss
	>=dev-qt/qtcore-5.12.9:5
	>=dev-qt/qtgui-5.12.9:5
	>=dev-qt/qtnetwork-5.12.9:5
	>=dev-qt/qtprintsupport-5.12.9:5
	>=dev-qt/qtsvg-5.12.9:5
	>=media-gfx/sane-backends-1.0
"

QA_PREBUILT="/opt/${PN}/masterpdfeditor5"

S="${WORKDIR}/${PN}-${PV%%.*}"

src_install() {
	insinto /opt/${PN}
	doins -r fonts lang stamps templates masterpdfeditor4.png

	exeinto /opt/${PN}
	doexe masterpdfeditor4
	dosym ../${PN}/masterpdfeditor4 /opt/bin/masterpdfeditor4

	make_desktop_entry "masterpdfeditor4 %f" \
		"Master PDF Editor ${PV}" /opt/${PN}/masterpdfeditor4.png \
		"Office;Graphics;Viewer" \
		"MimeType=application/pdf;application/x-bzpdf;application/x-gzpdf;\nTerminal=false"
}