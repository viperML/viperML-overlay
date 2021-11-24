# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""

IUSE="-libhoudini"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

SRC_URI="https://build.anbox.io/android-images/${PV//./\/}/android_amd64.img -> anbox-${PV}.img"

# if [[ use "libhoudini" ]]; then
# 	:
# fi

DEPEND=">=sys-fs/squashfs-tools-4.5[lzma]"
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	mkdir "${WORKDIR}/rootfs"
	unsquashfs -f -d "${WORKDIR}/rootfs" "${DISTDIR}/anbox-${PV}.img" || die
}

src_prepare() {
	eapply_user

	# Image finished, packing it again
	mksquashfs ./rootfs android.img -noappend -b 131072 -comp xz -Xbcj x86 || die
}


src_install() {
	insinto /var/lib/anbox
	doins android.img
}
