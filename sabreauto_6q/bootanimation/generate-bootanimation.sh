#!/bin/bash
set -e
HERE="$(dirname $0)"
WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="/home/ssd/nxp-bsp/device/fsl/sabreauto_6q/bootanimation"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    SIZE="$HEIGHT"
else
    SIZE="$WIDTH"
fi

if [ "$HALF_RES" = "true" ]; then
    IMAGESIZE=$(expr $SIZE / 2)
else
    IMAGESIZE="$SIZE"
fi

RESOLUTION=""$IMAGESIZE"x"$IMAGESIZE""
mkdir -p $OUT/bootanimation/part{0..2}
# tar xfp "$OUT/bootanimation.tar" --to-command "convert - -resize '$RESOLUTION' \"png8:$OUT/bootanimation/\$TAR_FILENAME\""

# Create desc.txt
echo "$WIDTH" "$HEIGHT" 30 > "$OUT/bootanimation/desc.txt"
cat "$OUT/desc.txt" >> "$OUT/bootanimation/desc.txt" # Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
