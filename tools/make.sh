#!/bin/sh

TOIT_FONT_TOOLS=third_party/toit-font-tools/app
DIR_MUTT=xorg-mutt-misc
TOIT_RUN=toit.run
CONVERT=$TOIT_FONT_TOOLS/convertfont.toit
VERBOSE=
OUTPUT=src

set -e

if [ ! -f "COPYING" -o ! -d "third_party" ]
then
  echo "Please run from top level directory"
  exit 1
fi

git submodule update --recursive --init

mkdir -p src

cp $DIR_MUTT/COPYING .

(cd $TOIT_FONT_TOOLS && toit.pkg install)


$TOIT_RUN $CONVERT $VERBOSE $DIR_MUTT/cu12.bdf "clearly_u_12" $OUTPUT/clearly_u_12.toit
$TOIT_RUN $CONVERT $VERBOSE --bold $DIR_MUTT/cu12.bdf "clearly_u_12_autobold" $OUTPUT/clearly_u_12_autobold.toit
