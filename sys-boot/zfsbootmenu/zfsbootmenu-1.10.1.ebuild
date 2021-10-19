# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ZFS Bootloader for root-on-ZFS systems"
HOMEPAGE="https://github.com/zbm-dev/zfsbootmenu"

if [[ ${PV} == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zbm-dev/${PN}"
else
	SRC_URI="https://github.com/zbm-dev/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

PATCHES=("${FILESDIR}/branding.patch")

LICENSE="MIT"
SLOT="0"

IUSE="+efi +systemd"

DEPEND="
app-shells/fzf
sys-apps/kexec-tools
sys-block/mbuffer
dev-perl/Sort-Versions
dev-perl/Config-IniFiles
dev-perl/YAML-PP
dev-perl/boolean
efi? (
	systemd? ( sys-apps/systemd )
	!systemd? ( sys-boot/systemd-boot )
)
sys-fs/zfs
sys-kernel/dracut
"

RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"
