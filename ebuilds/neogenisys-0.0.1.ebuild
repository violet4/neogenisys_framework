EAPI=7
PYTHON_COMPAT=( python3_11 )

inherit python-single-r1

DESCRIPTION="Your project description here"
HOMEPAGE="https://github.com/violet4/neogenisys_framework"
SRC_URI="https://github.com/violet4/neogenisys_framework/archive/v${PV}.tar.gz"

LICENSE="Your License Here"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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