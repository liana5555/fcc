#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# GENERATING RANDOM NUM BETWEEN 1 AND 1000
MY_RANDOM=$(( $RANDOM%1000+10 ))
echo $MY_RANDOM
NUMBER_OF_GUESSES=0
GUESS=-1001

#Promting the user to enter their username
echo -e "Enter your username:"
read USER_NAME
#check if the username is already in the database
SEARCH_USER=$($PSQL "SELECT user_name FROM users where user_name='$USER_NAME';")

NUMBER_OF_GAMES=$($PSQL "SELECT count(GAME_ID) FROM users full join games using(user_id) where user_name='$USER_NAME' group by user_id;")
BGUESS=$($PSQL "SELECT min(number_of_guesses) FROM users full join games using(user_id) where user_name='$USER_NAME' group by user_id;")


if [[ -z $SEARCH_USER ]]
then
  #if user doesn't exist we welcome them
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO users(user_name) values('$USER_NAME')")
else
  
      echo -e "Welcome back, $SEARCH_USER! You have played $NUMBER_OF_GAMES games, and your best game took $BGUESS guesses."
          
fi

#Prompting the guess
echo -e "\nGuess the secret number between 1 and 1000:"

while [ $GUESS -ne $MY_RANDOM ]
do
  read GUESS
  ((NUMBER_OF_GUESSES+=1))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
  else
    if [[ $GUESS -lt $MY_RANDOM ]]
    then
      echo -e "It's higher than that, guess again:"
    elif [[ $GUESS -eq $MY_RANDOM ]]
    then
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $MY_RANDOM. Nice job!" 
      USER_ID=$($PSQL "select user_id from users where user_name='$USER_NAME';")
      INSERT_GAME=$($PSQL "insert into games(number_of_guesses, user_id) values($NUMBER_OF_GUESSES, $USER_ID);")
    else
      echo -e "It's lower than that, guess again:"
    fi
  fi
done

