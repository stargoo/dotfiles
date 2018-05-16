function micro_to_hms(){
  seconds="${1}/1000"
  printf "seconds: %02d\n" $seconds
  d="(${1}/86400000000)"
  h="(${1}%86400000000)/3600000000"
  m="(${1}%3600000000)/60000000"
  s="(${1}%60000000)/1000000"
  ms="(${1}%1000000)/1000"
  us="(${1}%1000)"
  printf "DY:HR:MI:SE:MS:US\n"
  printf "%02d:%02d:%02d:%02d:%02d:%02d\n" $d $h $m $s $ms $us

}

