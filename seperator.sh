fn(){
    touch ${1}
    for TEXT in $*
    do 
        # echo ${TEXT}
        if [[ ${TEXT} != ${1} ]]
        then
            echo -n "${TEXT} " >> ${1}
        fi
    done

}

while read LINE
do 
    fn ${LINE}
done < ${1}