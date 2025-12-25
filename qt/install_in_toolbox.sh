# Rode esse script dentro do container que vc criou

sudo dnf install -y \
  gcc gcc-c++ \
  clang clang-tools-extra \
  make \
  cmake \
  ninja \
  gdb \
  lldb \
  pkgconf-pkg-config \
  git \
  rsync \
  which \
  file

sudo dnf install -y \
  qt5-qtbase-devel \
  qt5-qttools-devel \
  qt5-qtdeclarative-devel \
  qt5-qtsvg-devel \
  qt5-qtwebengine-devel \
  qt-chooser

sudo dnf install -y \
  qt6-qtbase-devel \
  qt6-qttools-devel \
  qt6-qtdeclarative-devel \
  qt6-qtsvg-devel \
  qt6-qtwebengine-devel
