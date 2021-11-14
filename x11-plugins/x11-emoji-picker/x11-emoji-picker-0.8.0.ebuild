# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A dialog / emoji picker inspired by the Windows 10 emoji picker"
HOMEPAGE="https://github.com/GaZaTu/x11-emoji-picker"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/GaZaTu/x11-emoji-picker"
else
	SRC_URI="https://github.com/GaZaTu/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-qt/qtcore
	dev-qt/qtgui
	dev-qt/qtwidgets
	dev-libs/icu
	x11-misc/xdotool
"
RDEPEND="${DEPEND}"