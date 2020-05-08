## Bash scripting 

## Printing
to print or console.log
* echo does newline
```sh 
echo 
# without newline 
echo -n
```

### Variables
* you have to be very specifc about spacing 

 
* to define a var
> no spaces,
```sh
VAR=VALUE
VAR=$(echo -n "str_or_var" | command_name | awk '{print $1}')
```
* to refer to a var
```sh
$VAR
```
* included in a command 
* SO YOU can concat strings
```sh 
echo "${VAR}'s dog is kaia"
corey's dog is kaia
```
```sh
echo "${VAR}${VAR}"
coreycorey
```



* python3's sys.argv 
```sh
$1 - $n 
the script itself $0
```

* to export vars to make them env vars

```sh
first_var='alpha'
second_var='bravo'
export first_var
export second_var
```


### Special Variables 

* __$#__ - total # of args
* __$@__ - values of all the args
* __$*__ - all args double quoted
* __$?__ - exit status of last command
* __$!__ - process ID of last command
* __$$__ - pid of current script 
* __$IFS__ internal field seperator, allows you to change a delimiter on how a file is split line by line
* __$USER__ - username person executing script 
* __$HOSTNAME__ - machine the script is running on 
* __$SECONDS__: The number of seconds the script has been running for.
* __$RANDOM__: Returns a random number.
* __$LINENO__: Returns the current line number of the script.

### Reading Files 
* while loop input redirection 
```sh
while read line
do 
    echo ${line}
done < filename 
```

* __break__ keyword, same functionality as break in python  


### If-Else 
* if 
* then 
* else 
* fi 
* conditional use square brakets
* tests use comparison operators 


```sh
if [[ -e $1]]
then 
    echo "It exists"
else 
    echo "it does not exist"
fi
# to negate ! but spaces is important
if [[ ! -e $1]]
then 
    echo "It exists"
else 
    echo "it does not exist"
fi
```

#### Comparison Operators 

* __-eq__ = Equal 
* __-ne__ = Not equal 
* __-gt__ = Greater than 
* __-lt__ = Less than 
* __-z__ = String is 
    - nul is an "" in sh
* __-n__ = String is not nul
* __==__ - string equal



#### File Test Operators

* __-e__ = File exists 
* __-f__ = File is a file not a directory or device 
* __-d__ = File is a directory 
* __-s__ = File size is not zero 
* __-r__ = User running script has read permission to file
* __-w__ = User running script has  write to file 
* __-x__ = User running script has  execute to file


#### For Loops 
* the quotes in  "${SHARK}" means one item 
* no quotes means the items inside "${SHARK}" 
* if you use IFS use single quotes, like this 
> IFS=$'\n'
* also do unset IFS once your are done 
```sh
for VAR in LIST 
do 
    echo ${VAR}
done 
SHARK='A LIST'
for var in "${SHARK}"
do
done 

IFS=$'\n'
for var in ${SHARK}
do
done 
unset IFS
```

* to loop through a stirng
```sh
 read ${MY_IP}  # depends sometimes
for i in $(seq 1 ${#MY_IP})
do
  echo "${MY_IP:i-1:1}"
done
```

#### Types of Lists

* string = "apple banan cherry"
* command - $(cat filename)
* ranges - {1..5}
    - if you zfill {01..15} it will understand to zfill all values 

to make a list
```sh 
MY_LIST="apple banan cherry"
```
#### Functions 
* they command args and the fn use the same special chars becasue of scoping
* if you want the command line args insde the fn assign to an new variable before using 
```sh
echo $2
shark(){
    echo $2
    echo $*
}
shark 1 2 3 4 5
echo $2
```

#### Mathematcis 
to do basic math 
```sh
$(expr 1 + 1)
$(expr  ${MY_NUM} + 1)
```


#### Tricks

* to replace a delimiter
* and help get newlines into a file after creation because the \n is taken literally
> look at the tr command
```sh
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

for VAR in $( ( (echo ${LOOP_LIST}  | tr '~' '\n') | sort  -h ) |cat ) 
do 
    echo ${VAR}
done
```