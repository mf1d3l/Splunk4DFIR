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
sqlecmd='dotnet /opt/SQLECmd/SQLECmd/SQLECmd.dll'
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
find "$INPUT_PATH" -type f -name '$MFT' -exec $mftecmd -f {} --body "$OUTPUT_PATH" --blf --bdl C: \;
find "$OUTPUT_PATH" -type f -name '*.body' -exec mactime -y -d -b {} > "$OUTPUT_PATH"/timeline_"$(date +%s)".csv \;
find "$OUTPUT_PATH" -type f -name '*.body'-exec rm {} \;
find "$INPUT_PATH" -type f -name '$J' -exec $mftecmd -f {} --csv "$OUTPUT_PATH" \;
$recmd --bn /opt/RECmd/RECmd/BatchExamples/Kroll_Batch.reb -d "$INPUT_PATH" --csv "$OUTPUT_PATH"
find "$INPUT_PATH" -type f -wholename '*/Windows/System32/config/SYSTEM' -exec $appcompatcacheparser -f {} --csv "$OUTPUT_PATH" \;
find "$INPUT_PATH" -type f -name 'Amcache.hve' -exec $amcacheparser -f {} --csv "$OUTPUT_PATH" \;
find "$INPUT_PATH" -type d -wholename '*/winevt/logs' -exec $evtxecmd -d {} --csv "$OUTPUT_PATH" \;
find "$INPUT_PATH" -type d -name '$Recycle.Bin' -exec $rbcmd -d {} --csv "$OUTPUT_PATH" \;

for USERPATH in $(find "$INPUT_PATH" -type f -name UsrClass.dat | grep -oP '.*/Users/[^/]+' ) ;do
  USER=$(echo $USERPATH | grep -oP "[^/]+$");
  $sbecmd -d $USERPATH --csv "$OUTPUT_PATH" --csvf SBECmd_$USER.csv
  find "$USERPATH" -type d -wholename '*/Microsoft/Windows/Recent' -exec $lecmd -d {} --csv "$OUTPUT_PATH" --csvf LECmd_$USER.csv \;
  find "$USERPATH" -type d -wholename '*/Microsoft/Windows/Recent/AutomaticDestinations' -exec $jlecmd -d {} --csv "$OUTPUT_PATH" --csvf JLECmd_$USER.csv \;
done
