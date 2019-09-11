#!/usr/bin/awk -f

BEGIN {
  print "<informaltable>";
  print "<tgroup cols='2'>";
  print "<colspec colwidth='*'/>";
  print "<colspec colwidth='10*'/>";
  print "<tbody>";
  FS=",";
  print "<row><entry>#</entry><entry>Description</entry></row>";
}

{
  print "<row><entry>" $1 "</entry><entry>" $2 "</entry></row>";
}

END {
  print "</tbody>";
  print "</tgroup>";
  print "</informaltable>";
}
