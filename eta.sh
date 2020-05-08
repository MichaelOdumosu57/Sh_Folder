echo $1
echo $2
now 


if [[ $# -ne 2 ]]
then 
    echo "2 args required" 
    exit 1
else 
    echo "The task ${2} is scheduled to be completed by ${1}"
fi