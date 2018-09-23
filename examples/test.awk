BEGIN {
  print "HELLO;WORLD;";
}

{
  print $0;
}

END {
  print "END";
}