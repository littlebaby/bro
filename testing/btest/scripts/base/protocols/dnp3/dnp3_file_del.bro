#
# @TEST-EXEC: bro -r $TRACES/dnp3/dnp3_file_del.pcap %DIR/events.bro >output
# @TEST-EXEC: btest-diff output
# @TEST-EXEC: cat output | awk '{print $1}' | sort | uniq | wc -l >covered
# @TEST-EXEC: cat ${DIST}/src/event.bif  | grep "^event dnp3_" | wc -l >total
# @TEST-EXEC: echo `cat covered` of `cat total` events triggered by trace >coverage
# @TEST-EXEC: btest-diff coverage
#
