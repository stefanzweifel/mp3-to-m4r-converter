#!/bin/sh
#
# Convert ".mp3"-Files into ".m4r" iOS Ringtones
#
# Author: Stefan Zweifel <https://stefanzweifel.io>

# Path where your mp3 source files are
SOURCE_DIR='src/'

###############################
# DO NOT EDIT BELOW THIS LINE #
###############################

cd $SOURCE_DIR;

for D in *; do

    # Is ffmpeg available?
    COMMAND_PATH=$(which ffmpeg);

    # Throw error message if ffmpeg isn't available
    if [[ $COMMAND_PATH == '' ]]
        then
        echo "ffmpeg Command not found. Install it with 'brew install ffmpeg'";
        exit;
    fi

    # Check if any logs are available. If not, scripts ends
    if [[ $D == '*' ]]
        then
        echo "No files found. Abort.";
        exit;
    fi

    echo "Current file: " $D;

    # Get Filename
    NAME=$( echo $D | cut -d'.' -f 1;);

    # Define output paths
    DEST_M4A="../dist/$NAME.m4a";
    DEST_M4R="../dist/$NAME.m4r";

    # Convert File
    $COMMAND_PATH -i $D -y $DEST_M4A -stats;

    # Rename File
    mv $DEST_M4A $DEST_M4R;

done

echo "";
echo "-----------------";
echo "";
echo "♪ ♪ Finished ♪ ♪";
echo "";
echo "-----------------";
echo "";
