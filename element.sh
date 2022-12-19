#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


function IN_CASE_OF_ARGUMENT () {
  #echo -e "\nYou gave an argument"
  # length of the argument
  arg_length=`expr "$1" : '.*'`
  # if the argument is not a digit
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    if [[ $arg_length < 3 ]]
    then
     #echo "The argument is a symbol"
     SELECT_ELEMENT=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where symbol='$1'")
     CHECKING_AND_WRITING_SE

    else
     #echo "The argument is a name"
     SELECT_ELEMENT=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where name='$1'")
     CHECKING_AND_WRITING_SE
     
    fi
  else 
  #if the argument is a digit
  SELECT_ELEMENT=$($PSQL "select * from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number=$1")
  CHECKING_AND_WRITING_SE


  fi
}

function CHECKING_AND_WRITING_SE () {
    if [[ -z $SELECT_ELEMENT ]]
  then
    echo -e "I could not find that element in the database."
  else
    echo $SELECT_ELEMENT | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE
    do
      echo -e "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi

}

#Main part where you check if there is an argument or not

if [[ -z $1 ]]
then
echo -e "Please provide an element as an argument."
else
#Ha adunk meg argumentet
  IN_CASE_OF_ARGUMENT $1
fi

#test: 






