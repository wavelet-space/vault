

## SHEBANG

    #!bin/sh

## VARIABLES

    VAR=String
    VAR="String"
    VAR="String with spaces"
    VAR=1

### ECHO, READ

    echo Enter your name: 
    read NAME
    echo $NAME
    echo ${NAME}
    touch ${NAME}_file.txt


## EXPORT


## CONDITIONS

### IF

### CASE


## LOOPS


## FUNCTIONS


# SHELL CHEATSHEET

Zjisti jestli soubor existuje.

    $file="etc/hosts"

    if [ -f "$file" ]; then
        echo "$file found"
    else 
        echo "$file not found" 
    fi


    [ -f /etc/hosts ] && echo "found" || echo "not found"

       -b FILE exists and is block special
       -c FILE exists and is character special
       -d FILE exists and is a directory
       -e FILE exists
       -f FILE exists and 
       -g FILE exists and is set-group-ID
       -G FILE exists and is owned by the effective group ID
       -h FILE exists and is a symbolic link (same as -L)
       -k FILE exists and has its sticky bit set
       -L FILE exists and is a symbolic link (same as -h)
       -O FILE exists and is owned by the effective user ID
       -p FILE exists and is a named pipe
       -r FILE exists and read permission is granted
       -s FILE exists and has a size greater than zero
       -S FILE exists and is a socket
       -t FD  file descriptor FD is opened on a terminal
       -u FILE exists and its set-user-ID bit is set
       -w FILE exists and write permission is granted
       -x FILE exists and execute (or search) permission is granted

## Proměnná

    var=value
    echo $var
    echo $$   proces id aktuálního shellu
    echo $!
    echo $! zobrazí exit status posledního příkazu
    export VAR=value definuje proměnnou prostředí přístupnou pro všechny podprocesy

## Pole
    
    array[0] = value1
    array[1] = value2
    array[2] = value3

    array=([2]=value3 [1]=value2 [0]=value1)
    array(value1 value2 value3)

    ${array[i]}  získání prvku s indexem i (implicitně 0 pokud není udán)
    ${#array[i]} vrací délku prvku s indexem i
    ${#array[@]} vrací délku pole (počet prvků)

    

