# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="A prompt theme engine for any shell"
HOMEPAGE="https://ohmyposh.dev/"

EGO_SUM=(
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/JanDeDobbeleer/battery v0.10.0-2"
	"github.com/JanDeDobbeleer/battery v0.10.0-2/go.mod"
	"github.com/Masterminds/goutils v1.1.1"
	"github.com/Masterminds/goutils v1.1.1/go.mod"
	"github.com/Masterminds/semver v1.5.0"
	"github.com/Masterminds/semver v1.5.0/go.mod"
	"github.com/Masterminds/sprig v2.22.0+incompatible"
	"github.com/Masterminds/sprig v2.22.0+incompatible/go.mod"
	"github.com/StackExchange/wmi v0.0.0-20210224194228-fe8f1750fd46"
	"github.com/StackExchange/wmi v0.0.0-20210224194228-fe8f1750fd46/go.mod"
	"github.com/agext/levenshtein v1.2.1/go.mod"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38/go.mod"
	"github.com/alecthomas/colour v0.1.0"
	"github.com/alecthomas/colour v0.1.0/go.mod"
	"github.com/alecthomas/repr v0.0.0-20210301060118-828286944d6a"
	"github.com/alecthomas/repr v0.0.0-20210301060118-828286944d6a/go.mod"
	"github.com/apparentlymart/go-dump v0.0.0-20180507223929-23540a00eaa3/go.mod"
	"github.com/apparentlymart/go-textseg v1.0.0/go.mod"
	"github.com/apparentlymart/go-textseg/v13 v13.0.0/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/esimov/stackblur-go v1.0.0"
	"github.com/esimov/stackblur-go v1.0.0/go.mod"
	"github.com/fogleman/gg v1.3.0"
	"github.com/fogleman/gg v1.3.0/go.mod"
	"github.com/go-ole/go-ole v1.2.5"
	"github.com/go-ole/go-ole v1.2.5/go.mod"
	"github.com/go-test/deep v1.0.3/go.mod"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0/go.mod"
	"github.com/golang/protobuf v1.1.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.4/go.mod"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/google/gofuzz v1.0.0/go.mod"
	"github.com/google/uuid v1.2.0"
	"github.com/google/uuid v1.2.0/go.mod"
	"github.com/gookit/color v1.3.6/go.mod"
	"github.com/gookit/color v1.4.2"
	"github.com/gookit/color v1.4.2/go.mod"
	"github.com/gookit/config/v2 v2.0.24"
	"github.com/gookit/config/v2 v2.0.24/go.mod"
	"github.com/gookit/goutil v0.3.8/go.mod"
	"github.com/gookit/goutil v0.3.13/go.mod"
	"github.com/gookit/goutil v0.3.14"
	"github.com/gookit/goutil v0.3.14/go.mod"
	"github.com/gookit/ini/v2 v2.0.9/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hashicorp/hcl/v2 v2.10.0/go.mod"
	"github.com/huandu/xstrings v1.3.2"
	"github.com/huandu/xstrings v1.3.2/go.mod"
	"github.com/imdario/mergo v0.3.12"
	"github.com/imdario/mergo v0.3.12/go.mod"
	"github.com/jessevdk/go-flags v1.4.0/go.mod"
	"github.com/json-iterator/go v1.1.10/go.mod"
	"github.com/json-iterator/go v1.1.11"
	"github.com/json-iterator/go v1.1.11/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kylelemons/godebug v0.0.0-20170820004349-d65d576e9348/go.mod"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-isatty v0.0.13"
	"github.com/mattn/go-isatty v0.0.13/go.mod"
	"github.com/mitchellh/copystructure v1.2.0"
	"github.com/mitchellh/copystructure v1.2.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7/go.mod"
	"github.com/mitchellh/mapstructure v1.4.1"
	"github.com/mitchellh/mapstructure v1.4.1/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.2"
	"github.com/mitchellh/reflectwalk v1.0.2/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180228061459-e0a39a4cb421/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v0.0.0-20180701023420-4b7aa43c6742/go.mod"
	"github.com/modern-go/reflect2 v1.0.1"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/sergi/go-diff v1.2.0"
	"github.com/sergi/go-diff v1.2.0/go.mod"
	"github.com/shirou/gopsutil v3.21.5+incompatible"
	"github.com/shirou/gopsutil v3.21.5+incompatible/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v1.6.4"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/spf13/pflag v1.0.2/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.3.0"
	"github.com/stretchr/objx v0.3.0/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.6.1/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/tklauser/go-sysconf v0.3.6"
	"github.com/tklauser/go-sysconf v0.3.6/go.mod"
	"github.com/tklauser/numcpus v0.2.2"
	"github.com/tklauser/numcpus v0.2.2/go.mod"
	"github.com/vmihailenco/msgpack v3.3.3+incompatible/go.mod"
	"github.com/vmihailenco/msgpack/v4 v4.3.12/go.mod"
	"github.com/vmihailenco/tagparser v0.1.1/go.mod"
	"github.com/wayneashleyberry/terminal-dimensions v1.0.0"
	"github.com/wayneashleyberry/terminal-dimensions v1.0.0/go.mod"
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778"
	"github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778/go.mod"
	"github.com/zclconf/go-cty v1.2.0/go.mod"
	"github.com/zclconf/go-cty v1.8.0/go.mod"
	"github.com/zclconf/go-cty-debug v0.0.0-20191215020915-b22d67c1ba0b/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190426145343-a29dc8fdc734/go.mod"
	"golang.org/x/crypto v0.0.0-20201221181555-eec23a3978ad/go.mod"
	"golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a"
	"golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a/go.mod"
	"golang.org/x/image v0.0.0-20210607152325-775e3b0c77b9"
	"golang.org/x/image v0.0.0-20210607152325-775e3b0c77b9/go.mod"
	"golang.org/x/net v0.0.0-20180811021610-c39426892332/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190502175342-a43fa875dd82/go.mod"
	"golang.org/x/sys v0.0.0-20190912141932-bc967efca4b8/go.mod"
	"golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3/go.mod"
	"golang.org/x/sys v0.0.0-20191026070338-33540a1f6037/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200720211630-cb9d2d5c5666/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210316164454-77fc1eacc6aa/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210608053332-aa57babbf139"
	"golang.org/x/sys v0.0.0-20210608053332-aa57babbf139/go.mod"
	"golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.5/go.mod"
	"golang.org/x/text v0.3.6"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.6.5/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/ini.v1 v1.62.0"
	"gopkg.in/ini.v1 v1.62.0/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.3.0/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
	"gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b/go.mod"
	"howett.net/plist v0.0.0-20181124034731-591f970eefbb/go.mod"
	"howett.net/plist v0.0.0-20201203080718-1454fab16a06"
	"howett.net/plist v0.0.0-20201203080718-1454fab16a06/go.mod"
)

go-module_set_globals

SRC_URI="
	https://github.com/JanDeDobbeleer/${PN}/archive/refs/tags/v${PV}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
S="${WORKDIR}/${P}/src"

RDEPEND=""

DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-lang/go-1.16
"

src_compile() {
	elog `pwd`
	go build -o oh-my-posh
	elog `ls`
}

src_install() {
	dobin oh-my-posh
}