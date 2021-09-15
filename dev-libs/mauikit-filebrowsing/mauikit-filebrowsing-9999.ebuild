# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_QTHELP="true"
KFMIN=5.60.0
QTMIN=5.12.3
inherit ecm kde.org

DESCRIPTION="Templated convergent controls and multiplatform utilities for Maui applications"
EGIT_REPO_URI="https://invent.kde.org/maui/mauikit-filebrowsing"

LICENSE="LGPL-3"
SLOT="5"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mauikit
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
"
RDEPEND="${DEPEND}
"

S="${WORKDIR}/${P/-2/-v2}"
