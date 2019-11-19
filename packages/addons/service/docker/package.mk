# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2017 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="docker"
PKG_STABLE="yes"
if [ "$PKG_STABLE" = "yes" ]; then
  PKG_VERSION="19.03.5"
  PKG_SHA256="50cdf38749642ec43d6ac50f4a3f1f7f6ac688e8d8b4e1c5b7be06e1a82f06e9"
  PKG_REV="147"
  PKG_URL="https://download.docker.com/linux/static/stable/x86_64/${PKG_NAME}-${PKG_VERSION}.tgz"
  PKG_SOURCE_DIR="docker"
  PKG_BUILD_FLAGS="-strip"
else
  PKG_VERSION="18.09.7"
  PKG_SHA256="f05dc15f5c11635472534c3aaf759c39c1bba842dd1ac23059431c2fd1ae1795"
  PKG_REV="126"
  PKG_URL="https://github.com/docker/docker-ce/archive/v${PKG_VERSION}.tar.gz"
fi
PKG_LICENSE="ASL"
PKG_SITE="http://www.docker.com/"
PKG_DEPENDS_TARGET="toolchain systemd"
PKG_SECTION="service/system"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."
PKG_TOOLCHAIN="manual"

if [ "$PKG_STABLE" != "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET sqlite go:host containerd runc libnetwork tini"
fi

PKG_IS_ADDON="yes"
if [ "$PKG_STABLE" = "yes" ]; then
  PKG_ADDON_NAME="Docker stable"
else
  PKG_ADDON_NAME="Docker"
fi
PKG_ADDON_TYPE="xbmc.service"

post_unpack() {
  if [ "$PKG_STABLE" != "yes" ]; then
    for patch in `ls $PKG_DIR/patches.upstream/*.patch`; do
      cat $patch | patch -d \
      `echo $BUILD/$PKG_NAME-$PKG_VERSION | cut -f1 -d\ ` -p1
    done
  fi
}

configure_target() {
  if [ "$PKG_STABLE" != "yes" ]; then
    export DOCKER_BUILDTAGS="daemon \
                             autogen \
                             exclude_graphdriver_devicemapper \
                             exclude_graphdriver_aufs \
                             exclude_graphdriver_btrfs \
                             journald"

    case $TARGET_ARCH in
      x86_64)
        export GOARCH=amd64
        ;;
      arm)
        export GOARCH=arm

        case $TARGET_CPU in
          arm1176jzf-s)
            export GOARM=6
            ;;
          *)
            export GOARM=7
            ;;
        esac
        ;;
      aarch64)
        export GOARCH=arm64
        ;;
    esac

    export GOOS=linux
    export CGO_ENABLED=1
    export CGO_NO_EMULATION=1
    export CGO_CFLAGS=$CFLAGS
    export LDFLAGS="-w -linkmode external -extldflags -Wl,--unresolved-symbols=ignore-in-shared-libs -extld $CC"
    export GOLANG=$TOOLCHAIN/lib/golang/bin/go
    export GOPATH=$PKG_BUILD/.gopath_cli:$PKG_BUILD/.gopath
    export GOROOT=$TOOLCHAIN/lib/golang
    export PATH=$PATH:$GOROOT/bin

    mkdir -p $PKG_BUILD/.gopath
    mkdir -p $PKG_BUILD/.gopath_cli

    PKG_ENGINE_PATH=$PKG_BUILD/components/engine
    PKG_CLI_PATH=$PKG_BUILD/components/cli

    if [ -d $PKG_ENGINE_PATH/vendor ]; then
      mv $PKG_ENGINE_PATH/vendor $PKG_BUILD/.gopath/src
    fi

    if [ -d $PKG_CLI_PATH/vendor ]; then
      mv $PKG_CLI_PATH/vendor $PKG_BUILD/.gopath_cli/src
    fi

    # Fix missing/incompatible .go files
    cp -rf $PKG_BUILD/.gopath/src/github.com/moby/buildkit/frontend/* $PKG_BUILD/.gopath_cli/src/github.com/moby/buildkit/frontend
    cp -rf $PKG_BUILD/.gopath/src/github.com/moby/buildkit/frontend/gateway/* $PKG_BUILD/.gopath_cli/src/github.com/moby/buildkit/frontend/gateway
    cp -rf $PKG_BUILD/.gopath/src/github.com/moby/buildkit/solver/* $PKG_BUILD/.gopath_cli/src/github.com/moby/buildkit/solver
    cp -rf $PKG_BUILD/.gopath/src/github.com/moby/buildkit/util/progress/* $PKG_BUILD/.gopath_cli/src/github.com/moby/buildkit/util/progress
    cp -rf $PKG_BUILD/.gopath/src/github.com/docker/swarmkit/manager/* $PKG_BUILD/.gopath_cli/src/github.com/docker/swarmkit/manager
    cp -rf $PKG_BUILD/.gopath/src/github.com/coreos/etcd/raft/* $PKG_BUILD/.gopath_cli/src/github.com/coreos/etcd/raft
    cp -rf $PKG_BUILD/.gopath/src/golang.org/x/* $PKG_BUILD/.gopath_cli/src/golang.org/x
    cp -rf $PKG_BUILD/.gopath/src/github.com/opencontainers/runtime-spec/specs-go/* $PKG_BUILD/.gopath_cli/src/github.com/opencontainers/runtime-spec/specs-go

    rm -rf $PKG_BUILD/.gopath_cli/src/github.com/containerd/containerd
    mkdir -p $PKG_BUILD/.gopath_cli/src/github.com/containerd/containerd
    cp -rf $PKG_BUILD/.gopath/src/github.com/containerd/containerd/* $PKG_BUILD/.gopath_cli/src/github.com/containerd/containerd

    rm -rf $PKG_BUILD/.gopath_cli/src/github.com/containerd/continuity
    mkdir -p $PKG_BUILD/.gopath_cli/src/github.com/containerd/continuity
    cp -rf $PKG_BUILD/.gopath/src/github.com/containerd/continuity/* $PKG_BUILD/.gopath_cli/src/github.com/containerd/continuity

    mkdir -p $PKG_BUILD/.gopath_cli/src/github.com/docker/docker/builder
    cp -rf $PKG_ENGINE_PATH/builder/* $PKG_BUILD/.gopath_cli/src/github.com/docker/docker/builder

    if [ ! -L $PKG_BUILD/.gopath/src/github.com/docker/docker ];then
      ln -fs $PKG_ENGINE_PATH $PKG_BUILD/.gopath/src/github.com/docker/docker
    fi

    if [ ! -L $PKG_BUILD/.gopath_cli/src/github.com/docker/cli ];then
      ln -fs $PKG_CLI_PATH $PKG_BUILD/.gopath_cli/src/github.com/docker/cli
    fi

    # used for docker version
    export GITCOMMIT=${PKG_VERSION}
    export VERSION=${PKG_VERSION}
    export BUILDTIME="$(date --utc)"

    cd $PKG_ENGINE_PATH
    bash hack/make/.go-autogen
    cd $PKG_BUILD
  fi
}

make_target() {
  if [ "$PKG_STABLE" != "yes" ]; then
    mkdir -p bin
    PKG_CLI_FLAGS="-X 'github.com/docker/cli/cli.Version=${VERSION}'"
    PKG_CLI_FLAGS="${PKG_CLI_FLAGS} -X 'github.com/docker/cli/cli.GitCommit=${GITCOMMIT}'"
    PKG_CLI_FLAGS="${PKG_CLI_FLAGS} -X 'github.com/docker/cli/cli.BuildTime=${BUILDTIME}'"
    $GOLANG build -v -o bin/docker -a -tags "$DOCKER_BUILDTAGS" -ldflags "$LDFLAGS ${PKG_CLI_FLAGS}" ./components/cli/cmd/docker
    $GOLANG build -v -o bin/dockerd -a -tags "$DOCKER_BUILDTAGS" -ldflags "$LDFLAGS" ./components/engine/cmd/dockerd
  fi
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
  if [ "$PKG_STABLE" = "yes" ]; then
    cp -P $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/bin
  else
    cp -P $PKG_BUILD/bin/docker $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -P $PKG_BUILD/bin/dockerd $ADDON_BUILD/$PKG_ADDON_ID/bin

    # containerd
    cp -P $(get_build_dir containerd)/bin/containerd $ADDON_BUILD/$PKG_ADDON_ID/bin/containerd
    cp -P $(get_build_dir containerd)/bin/containerd-shim $ADDON_BUILD/$PKG_ADDON_ID/bin/containerd-shim

    # libnetwork
    cp -P $(get_build_dir libnetwork)/bin/docker-proxy $ADDON_BUILD/$PKG_ADDON_ID/bin/docker-proxy

    # runc
    cp -P $(get_build_dir runc)/bin/runc $ADDON_BUILD/$PKG_ADDON_ID/bin/runc

    # tini
    cp -P $(get_build_dir tini)/.$TARGET_NAME/tini-static $ADDON_BUILD/$PKG_ADDON_ID/bin/docker-init
  fi
}
