# how do you build this fork
# https://github.com/lexiforest/curl-impersonate

# this insane script tries to build brotli and fail
TERMUX_PKG_SRCURL=git+https://github.com/lwthiker/curl-impersonate
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_BUILD_IN_SRC=true

#to-do fix this proper build 
# TERMUX_PKG_SRCURL=git+https://github.com/john-peterson/curl
# TERMUX_PKG_GIT_BRANCH=imp
# TERMUX_PKG_EXTRA_CONFIGURE_ARGS=" -DUSE_NGHTTP2=ON -DCURL_BROTLI=ON -DOPENSSL_ROOT_DIR=$TERMUX_PREFIX/opt/boringssl -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$TERMUX_PREFIX/opt/curl-impersonate  -DCMAKE_INSTALL_LIBDIR=$TERMUX_PREFIX/opt/curl-impersonate/lib "
# -DCMAKE_CXX_FLAGS:=-fno-exceptions

TERMUX_PKG_DESCRIPTION="curl impersonation for curl_cffi"
TERMUX_PKG_VERSION=8.1.1
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_BUILD_DEPENDS="golang"
TERMUX_PKG_DEPENDS="boringssl-glibc, brotli-glibc, libnghttp2-glibc, zlib-glibc"
# TERMUX_PKG_DEPENDS=" libnghttp2-glibc, libnghttp3-glibc, libssh2-glibc"

# TERMUX_PKG_EXTRA_MAKE_ARGS=" -j4 "
TERMUX_PKG_MAKE_PROCESSES=4

termux_step_pre_configure() {
# export CXXFLAGS=-fno-exceptions
# export CFLAGS=-fno-exceptions
:
}

# termux_step_configure() {
# 	configure
# }

termux_step_post_configure() {
	# ack fno-exc build.ninja || exit
	# exit
: 
}

termux_step_make() { 
export MAKEFLAGS=-j4
# make chrome-build -C ../build
# sed -i '/unzip/i \\tpwd\n\tls' Makefile
# ack -C pwd Makefile
# exit
make chrome-build 
}

# termux_step_make_install() {
	# mkdir -p $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/lib
	# cp $TERMUX_PKG_BUILDDIR/* $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/lib/
	# :;
# }

# termux_step_post_make_install() {
# 	mv $TERMUX_PREFIX/opt/curl-impersonate/bin/curl $TERMUX_PREFIX/bin/curl-impersonate
# }

# termux_step_extract_into_massagedir() { :; }

# termux_step_post_massage() { :; }


