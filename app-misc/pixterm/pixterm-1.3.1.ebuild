# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Draw images in your ANSI terminal with true color"
HOMEPAGE="https://github.com/eliukblau/pixterm"

EGO_SUM=(
	"github.com/disintegration/imaging v1.6.2"
	"github.com/disintegration/imaging v1.6.2/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.3"
	"github.com/lucasb-eyer/go-colorful v1.0.3/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191206172530-e9b2fee46413"
	"golang.org/x/crypto v0.0.0-20191206172530-e9b2fee46413/go.mod"
	"golang.org/x/image v0.0.0-20191009234506-e7c1f5e7dbb8/go.mod"
	"golang.org/x/image v0.0.0-20191206065243-da761ea9ff43"
	"golang.org/x/image v0.0.0-20191206065243-da761ea9ff43/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
)

go-module_set_globals

SRC_URI="
	https://github.com/eliukblau/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

S="${WORKDIR}/${P}/cmd/${PN}"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""

DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-lang/go-1.13
"

src_compile() {
	go build -o "${PN}"
}

src_install() {
	dobin "${PN}"
}