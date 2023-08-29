EAPI=7
PYTHON_COMPAT=( python3_11 )

inherit python-single-r1

DESCRIPTION="Your project description here"
HOMEPAGE="https://github.com/violet4/neogenisys_framework"
SRC_URI="https://github.com/violet4/neogenisys_framework/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
# Only add architectures (such as x86) that you have actually tested.
# It's perfectly Ok to omit things, but it's a bad idea to include ones that you can't verify.
KEYWORDS="~amd64"
IUSE="docker kubernetes"

DEPEND="
    docker? ( app-emulation/docker )
    kubernetes? ( app-emulation/kubernetes )
"
RDEPEND="${DEPEND}"

src_prepare() {
    default
}

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install
}
