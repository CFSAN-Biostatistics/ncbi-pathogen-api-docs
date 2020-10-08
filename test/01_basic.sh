#!/usr/bin/env bats

URL="https://www.ncbi.nlm.nih.gov/Structure/pathogen/tree/tree_srv.cgi?action=getneighbors&distance=4&accessions=PDT000608728.1,SAMN13035591,PDT000608727.1,FSIS21821478,qqq"
expected=$(cat $BATS_TEST_DIRNAME/$(basename $BATS_TEST_FILENAME).json)

tmpdir=$(mktemp --directory /$BATS_TMPDIR/$(basename $BATS_TEST_FILENAME).XXXXXX)
trap ' { rm -rf $tmpdir; } ' EXIT

@test "basic json download" {

  LOG="$tmpdir/log"
  echo "# LOG is at $LOG" >&3
  observed=$(wget "$URL" -O - 2>$LOG)

  logstr=$(cat $LOG)
  rm -f $LOG

  [ "$observed" == "$expected" ]

}

