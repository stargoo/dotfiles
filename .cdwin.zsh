function cdwin(){
    drive=$1[1]
    if [[ $drive =~ "m" || $drive =~ "M" ]]; then
        line=$(sed -e 's#^[Mm]:#/home/scott/mdrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "u" || $drive =~ "U" ]]; then
        line=$(sed -e 's#^[Uu]:#/home/scott/udrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "s" || $drive =~ "S" ]]; then
        line=$(sed -e 's#^[Ss]:#/home/scott/sdrive#' -e 's#\\#/#g' <<< "$1")
    fi
    print "change directory to $line"
    cd "$line"
}
