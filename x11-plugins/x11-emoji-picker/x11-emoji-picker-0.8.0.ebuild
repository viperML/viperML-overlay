# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A dialog / emoji picker inspired by the Windows 10 emoji picker"
HOMEPAGE="https://github.com/GaZaTu/x11-emoji-picker"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/GaZaTu/x11-emoji-picker"
else
	SRC_URI="https://github.com/GaZaTu/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT CC-BY-4.0 unicode"
SLOT="0"

QTMIN="5.15.2"

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-libs/icu-69.1-r1
	>=x11-misc/xdotool-3.20210903.1
"
RDEPEND="${DEPEND}"