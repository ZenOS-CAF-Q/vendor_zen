#!/bin/sh
if [ "$1" ]
then
  file_path=$1
  filename=$(basename "$file_path")
  if [ -f $file_path ]; then
    version=$(grep ro\.modversion $OUT/system/build.prop | cut -d= -f2);
    romtype=$(grep ro\.zen\.releasetype $OUT/system/build.prop | cut -d= -f2);
    size=$(stat -c%s $file_path);
    datetime=$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2);
    id=$(sha256sum $file_path | awk '{ print $1 }');
    url="";
    echo "{\n  \"response\": [\n    {\n      \"filename\": \"$filename\",\n      \"version\": \"v$version\",\n      \"romtype\": \"$romtype\",\n      \"size\": \"$size\",\n      \"datetime\": $datetime,\n      \"id\": \"$id\",\n      \"url\": \"$url\"\n    }\n  ]\n}" > $OUT/$ZEN_BUILD.json
  fi
fi
