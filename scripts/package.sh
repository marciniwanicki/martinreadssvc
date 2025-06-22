#!/bin/bash
set -e

# Variables
PKG_NAME="martinreadssvc"
PKG_VERSION="0.0.1"
ARCH="amd64"
MAINTAINER="Marcin Iwanicki <iwan@icode.pl>"
DESCRIPTION="MartinReadsSvc Go API service"
BIN_PATH="bin/${PKG_NAME}"
PKG_DIR="bin/package_build"
DEB_OUTPUT="bin/${PKG_NAME}_${PKG_VERSION}_${ARCH}.deb"

# Clean up old build dir
rm -rf ${PKG_DIR}

# Create folder structure
mkdir -p ${PKG_DIR}/DEBIAN
mkdir -p ${PKG_DIR}/usr/local/bin

# Copy binary
cp "${BIN_PATH}" "${PKG_DIR}/usr/local/bin/"
chmod 755 "${PKG_DIR}/usr/local/bin/${PKG_NAME}"

# Create control file
cat > ${PKG_DIR}/DEBIAN/control <<EOF
Package: ${PKG_NAME}
Version: ${PKG_VERSION}
Section: utils
Priority: optional
Architecture: ${ARCH}
Maintainer: ${MAINTAINER}
Description: ${DESCRIPTION}
EOF

# Build .deb package
dpkg-deb --build ${PKG_DIR}

# Move .deb to bin/
mv "${PKG_DIR}.deb" "${DEB_OUTPUT}"

echo "Package created at ${DEB_OUTPUT}"
