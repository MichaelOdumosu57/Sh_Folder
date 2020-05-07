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
* __$IFS__ internal field seperator, allows you to change a delimiter for a command
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