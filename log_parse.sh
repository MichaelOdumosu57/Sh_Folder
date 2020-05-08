ip_loop(){
    # echo 'start ip loop'
    # echo 
    LOOP_LIST=${LOOP_LIST}"~"${1}

}
LOOP_LIST=' '

while read line
do 
    ip_loop ${line}
done < ${1}


touch unsorted.txt

( (echo ${LOOP_LIST}  | tr '~' '\n') | sort  -h ) | cat
  
