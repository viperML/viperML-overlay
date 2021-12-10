# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="Fork of kwin blur effect, that solves the korner bug"
HOMEPAGE="https://github.com/Alban-Boissard/kwin-effects-blur-respect-rounded-decorations"

EGIT_REPO_URI="https://github.com/Alban-Boissard/${PN}"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"