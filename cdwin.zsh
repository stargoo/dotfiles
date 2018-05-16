function cdwin(){
    drive=${1:0:1}
    if [[ $drive =~ "m" || $drive =~ "M" ]]; then
        line=$(sed -e 's#^[Mm]:#/home/sie/mdrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "u" || $drive =~ "U" ]]; then
        line=$(sed -e 's#^[Uu]:#/home/sie/udrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "s" || $drive =~ "S" ]]; then
        line=$(sed -e 's#^[Ss]:#/home/sie/sdrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "r" || $drive =~ "R" ]]; then
        line=$(sed -e 's#^[Rr]:#/home/sie/rdrive#' -e 's#\\#/#g' <<< "$1")
    fi
    print "change directory to $line"
    cd "$line"
}

function wincd(){
    drive=${1:0:1}
    if [[ $drive =~ "m" || $drive =~ "M" ]]; then
        line=$(sed -e 's#^[Mm]:#/home/sie/mdrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "u" || $drive =~ "U" ]]; then
        line=$(sed -e 's#^[Uu]:#/home/sie/udrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "s" || $drive =~ "S" ]]; then
        line=$(sed -e 's#^[Ss]:#/home/sie/sdrive#' -e 's#\\#/#g' <<< "$1")
    elif [[ $drive =~ "r" || $drive =~ "R" ]]; then
        line=$(sed -e 's#^[Rr]:#/home/sie/rdrive#' -e 's#\\#/#g' <<< "$1")
    fi
    print "change directory to $line"
    cd "$line"
  }

