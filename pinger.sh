GREPPED_NETWORK=$(ipconfig | grep 192.168)
# echo ${GREPPED_NETWORK}
MY_IP=' '
IFS=$' '
for VAR in ${GREPPED_NETWORK}
do 
    # echo ${VAR}
    RIGHT_IPV4=$(echo ${VAR} | cut -c1-7 )
    if [[ ${RIGHT_IPV4} == "192.168" ]]
    then 
        MY_IP=${VAR}
        break
    fi    
done
unset IFS
MY_NET=' '
MY_COUNTER=0
# read ${MY_IP}
for i in $(seq 1 ${#MY_IP}) 
do
#   echo "${MY_IP:i-1:1}"
    MY_NET="${MY_NET}${MY_IP:i-1:1}"
    if [[ ${MY_IP:i-1:1} == "." ]]
    then 
        MY_COUNTER=$(expr ${MY_COUNTER} + 1)
        if [[ MY_COUNTER -eq 3 ]]
        then 
            break
        fi
    fi   
done
echo ${MY_NET}
string_loop(){
    echo 'start string loop'
    for i in $(seq 1 ${#1})
    do
        echo -n "${1:i-1:1}"
    done 
}
string_loop ${MY_NET}
echo

rm ping_sweet.txt
touch ping_sweet.txt
for NUM in {1..255}
do
    echo ${MY_NET}${NUM}
    ping -n 1 ${MY_NET}${NUM} >> ping_sweet.txt
done