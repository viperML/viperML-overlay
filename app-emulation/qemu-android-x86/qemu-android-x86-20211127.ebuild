# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils

DESCRIPTION="Android-x86 environment via QEMU and VirGL"
HOMEPAGE="https://github.com/viperML/qemu-android-x86"

IUSE="+android-7 -cyanogenmod-14"
REQUIRED_USE="^^ ( android-7 cyanogenmod-14 )"
COMMIT="2260c1a12bb7ab4656934f2cf81a3bd5558214cc"
SRC_URI="https://github.com/viperML/qemu-android-x86/archive/${COMMIT}.tar.gz
android-7? ( https://osdn.mirror.constant.com/android-x86/67834/android-x86-7.1-r5.x86_64.rpm )
cyanogenmod-14? ( https://osdn.mirror.constant.com/android-x86/68670/cm-x86-14.1-r4.x86_64.rpm )"

KEYWORDS="~amd64"

LICENSE="GPL-2 Apache-2.0 CC0-1.0"
SLOT="0"

RDEPEND="
	app-emulation/qemu[qemu_softmmu_targets_x86_64,qemu_user_targets_x86_64,virtfs,virgl,sdl,sdl-image,virtfs,vhost-net]
	acct-group/qemu-android-x86
"
DEPEND="
	acct-group/qemu-android-x86
	sys-fs/squashfs-tools
	app-arch/rpm2targz
"

S="${WORKDIR}/${PN}-${COMMIT}"

src_compile() {
	emake SOURCE_RPM="${DISTDIR}"/*.rpm
}

pkg_postinst() {
	xdg_icon_cache_update
	ewarn "Updating this package will wipe your system partitions!"
	einfo "Please add your user to the qemu-android-x86 group to use this package properly"
}