# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3 readme.gentoo-r1

DESCRIPTION="Arrange your windows automatically and switch between them using keyboard shortcuts"
HOMEPAGE="https://github.com/Bismuth-Forge/bismuth"

SRC_URI="https://github.com/Bismuth-Forge/${PN}/archive/refs/tags/v${PV}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"