POPPLER_VERSION=22.11.0
POPPLER_DATA_URL="https://poppler.freedesktop.org/poppler-data-0.4.11.tar.gz"
BUILD="0"

set -e
set -o pipefail

mkdir "poppler-$POPPLER_VERSION"
cd "poppler-$POPPLER_VERSION" || exit

find "$PKGS_PATH_DIR" -type f -name "*.dll" -exec cp {} ./Library/bin \;

rm -rf "$PKGS_PATH_DIR"

mkdir -p share/poppler
cd share || exit
curl $POPPLER_DATA_URL --output poppler-data.tar.gz
tar xvzf poppler-data.tar.gz -C poppler --strip-components 1
rm poppler-data.tar.gz

echo "POPPLER_VERSION=$POPPLER_VERSION" >> "$GITHUB_ENV"
echo "BUILD=$BUILD" >> "$GITHUB_ENV"
