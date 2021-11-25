# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Android image for running in Anbox"
HOMEPAGE="https://anbox.io"

IUSE="+houdini +opengapps"
LICENSE="GPL-3 android"
SLOT="0"
KEYWORDS="~amd64"

# Bump opengapps with package revisions
OPENGAPPS_VERSION="20211120"
OPENGAPPS_VARIANT="pico"

SRC_URI="https://build.anbox.io/android-images/${PV//./\/}/android_amd64.img -> anbox-${PV}.img
houdini?	( http://dl.android-x86.org/houdini/7_y/houdini.sfs -> houdini_y.sfs
			  http://dl.android-x86.org/houdini/7_z/houdini.sfs -> houdini_z.sfs )
opengapps?	( https://downloads.sourceforge.net/project/opengapps/x86_64/${OPENGAPPS_VERSION}/open_gapps-x86_64-7.1-${OPENGAPPS_VARIANT}-${OPENGAPPS_VERSION}.zip )
"

DEPEND=">=sys-fs/squashfs-tools-4.5[lzma]
opengapps? ( >=app-arch/lzip-1.22 )"
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	mkdir "${WORKDIR}/rootfs"
	einfo "Unpacking rootfs"
	unsquashfs -f -d "${WORKDIR}/rootfs" "${DISTDIR}/anbox-${PV}.img" || die

	if use houdini; then
		einfo "Unpacking houdini into rootfs"
		unsquashfs -f -d ${WORKDIR}/rootfs/system/lib/arm ${DISTDIR}/houdini_y.sfs || die
		mv ${WORKDIR}/rootfs/system/lib/arm/libhoudini.so ${WORKDIR}/rootfs/system/lib/libhoudini.so
		unsquashfs -f -d ${WORKDIR}/rootfs/system/lib64/arm64 ${DISTDIR}/houdini_z.sfs || die
		mv ${WORKDIR}/rootfs/system/lib64/arm64/libhoudini.so ${WORKDIR}/rootfs/system/lib64/libhoudini.so
	fi

	if use opengapps; then
		einfo "Unpacking opengapps into rootfs"
		unpack open_gapps-x86_64-7.1-${OPENGAPPS_VARIANT}-${OPENGAPPS_VERSION}.zip
		for app in ${WORKDIR}/Core/*.tar.lz; do
			tar --lzip -C ${WORKDIR}/rootfs/system/priv-app --strip-components=3 -xvf $app || die
		done
	fi
}

src_prepare() {
	einfo "Enabling opengles"
	echo 'ro.opengles.version=131072' >> rootfs/system/build.prop

	einfo "Installing additional codecs"
	cp ${FILESDIR}/*.xml rootfs/system/etc

	if use houdini; then
		einfo "Finalizing houdini install"
		mkdir -p rootfs/system/etc/binfmt_misc
		echo ':arm_exe:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28::/system/lib/arm/houdini:P' >> rootfs/system/etc/binfmt_misc/arm_exe
		echo ':arm_dyn:M::\x7f\x45\x4c\x46\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\x28::/system/lib/arm/houdini:P' >> rootfs/system/etc/binfmt_misc/arm_dyn
		echo ':arm64_exe:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7::/system/lib64/arm64/houdini64:P' >> rootfs/system/etc/binfmt_misc/arm64_exe
		echo ':arm64_dyn:M::\x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x03\x00\xb7::/system/lib64/arm64/houdini64:P' >> rootfs/system/etc/binfmt_misc/arm64_dyn

		sed -i '/^ro.product.cpu.abilist=x86_64,x86/ s/$/,arm64-v8a,armeabi-v7a,armeabi/' rootfs/system/build.prop
  		sed -i '/^ro.product.cpu.abilist32=x86/ s/$/,armeabi-v7a,armeabi/' rootfs/system/build.prop
  		sed -i '/^ro.product.cpu.abilist64=x86_64/ s/$/,arm64-v8a/' rootfs/system/build.prop

		echo 'persist.sys.nativebridge=1' >> rootfs/system/build.prop
		sed -i 's/ro.dalvik.vm.native.bridge=0/ro.dalvik.vm.native.bridge=libhoudini.so/' rootfs/default.prop
	fi

	eapply_user

	einfo "Re-packing rootfs"
	mksquashfs ./rootfs android.img -noappend -b 131072 -comp xz -Xbcj x86 || die
}

src_install() {
	insinto /var/lib/anbox
	doins android.img
}

src_postinst() {
	ewarn "The contents of /var/lib/anbox may be"
	ewarn "persient even when uninstalling this package"
	ewarn "or app-emulation/anbox"
}