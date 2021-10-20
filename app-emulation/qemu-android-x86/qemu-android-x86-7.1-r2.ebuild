# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm xdg-utils

DESCRIPTION="Android-x86 environment via QEMU and VirGL"
HOMEPAGE="https://github.com/viperML/qemu-android-x86"

ANDROID_X86_VERSION="7.1-r5"

SRC_URI="https://osdn.mirror.constant.com/android-x86/67834/android-x86-${ANDROID_X86_VERSION}.x86_64.rpm
https://github.com/viperML/${PN}/archive/refs/tags/${ANDROID_X86_VERSION}_${PR}.tar.gz -> ${PF}.tar.gz"

S="${WORKDIR}/${PN}-${ANDROID_X86_VERSION}_${PR}"

KEYWORDS="~amd64"

LICENSE="GPL-2 Apache-2.0 CC0-1.0"
SLOT="0"
IUSE="+rwsystem"

RDEPEND="
	app-emulation/qemu[qemu_softmmu_targets_x86_64,qemu_user_targets_x86_64,virtfs,virgl,sdl,sdl-image,virtfs,vhost-net]
	gnome-extra/zenity"

DEPEND="rwsystem? ( sys-fs/squashfs-tools )"

src_prepare() {
	default
	if use rwsystem ; then
		unsquashfs ../android-${ANDROID_X86_VERSION}/system.sfs
		mv squashfs-root/system.img .
	else
		mv ../android-${ANDROID_X86_VERSION}/system.sfs system.img
	fi
}

src_install() {
	dobin qemu-android

	insinto /usr/share/android-x86
	doins config
	doins ../android-${ANDROID_X86_VERSION}/initrd.img
	doins ../android-${ANDROID_X86_VERSION}/kernel
	doins ../android-${ANDROID_X86_VERSION}/ramdisk.img
	doins system.img

	insinto /usr/share/applications
	doins qemu-android.desktop
	insinto /usr/share/icons/hicolor/scalable/apps
	doins qemu-android.svg
}

pkg_postinst() {
	xdg_icon_cache_update

	ewarn "Runtime USE requirements for QEMU are not throughtfully tested!"
}