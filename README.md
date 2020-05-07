## Bash scripting 

* you have to be very specifc about spacing 

> Variables 
* no spaces,
* VAR=VALUE
* to refer to a var
```sh
$VAR
```
* included in a command 
* SO YOU can concat strings
```sh 
echo "${VAR}'s dog is kaia"
```

to print or console.log
* echo does newline
```sh 
echo 
```


* python3's sys.argv 
```sh
$1 - $n 
the script itself $0
```

### Special Variables 

* __$#__ - total # of args
* __$@__ - values of all the args
* __$*__ - all args double quoted
* __$?__ - exit status of last command
* __$!__ - process ID of last command
* __$IFS__ internal field seperator, allows you to change a delimiter on how a file is split line by line
* __$USER__ - username person executing script 
* __$HOSTNAME__ - machine the script is running on 


### Reading Files 
* while loop input redirection 
```sh
while read line
do 
    echo $line
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

*  -eq = Equal
*  
* 
* 
* 
* 
* 



#### For Loops 

```sh
for VAR in LIST 
do 
    echo ${VAR}
done 
```


#### Types of Lists

* string = "apple banan cherry"
* command - $(cat filename)
* ranges - {1..5}
    - if you zfill {01..15} it will understand to zfill all values 

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