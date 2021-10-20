# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ecm

DESCRIPTION="Lightly is a fork of breeze theme style that aims to be visually modern and minimalistic."
HOMEPAGE="https://github.com/Luwx/Lightly"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Luwx/Lightly.git"
else
	SRC_URI="https://github.com/Luwx/Lightly/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
	S="${WORKDIR}/Lightly-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="kde-frameworks/plasma
	dev-qt/qtx11extras
	kde-plasma/kdecoration
	dev-qt/qtdeclarative"

RDEPEND="${DEPEND}"