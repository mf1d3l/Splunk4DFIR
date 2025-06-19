#!/bin/bash

mftecmd='dotnet /opt/MFTEcmd/MFTECmd.dll'
amcacheparser='dotnet /opt/AmcacheParser/AmcacheParser.dll'
appcompatcacheparser='dotnet /opt/AppCompatCacheParser/AppCompatCacheParser.dll'
pecmd='dotnet /opt/PECmd/PECmd.dll'
recmd='dotnet /opt/RECmd/RECmd/RECmd.dll'
lecmd='dotnet /opt/LECmd/LECmd.dll'
jlecmd='dotnet /opt/JLECmd/JLECmd.dll'
rbcmd='dotnet /opt/RBCmd/RBCmd.dll'
evtxecmd='dotnet /opt/EvtxECmd/EvtxeCmd/EvtxECmd.dll'
sbecmd='dotnet /opt/SBECmd/SBECmd.dll'
sqlecmd='dotnet dotnet /opt/SQLECmd/SQLECmd/SQLECmd.dll'
srumecmd='dotnet /opt/SrumECmd/SrumECmd.dll'
sumecmd='dotnet /opt/SumECmd/SumECmd.dll'
wxtcmd='dotnet /opt/WxTCmd/WxTCmd.dll'

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_path> <output_path>"
    exit 1
fi

INPUT_PATH="$1"
OUTPUT_PATH="$2"

find "$INPUT_PATH" -type f -name '$MFT' -exec $mftecmd -f {} --csv "$OUTPUT_PATH" \;

