#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU () {
  SERVICES=$($PSQL "select * from services")
 

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo -e "$SERVICE_ID) $SERVICE_NAME"
  done

echo -e "\nChoose a service you would like!\n"
read SERVICE_ID_SELECTED

}

MAIN_MENU

#not a number
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
  MAIN_MENU
else
#it is a number 
  IS_PICKED_SERVICE_EXIST=$($PSQL "select * from services where service_id='$SERVICE_ID_SELECTED'")
  #if the number doesn't exist in the database
  if [[ -z $IS_PICKED_SERVICE_EXIST ]]
  then
    MAIN_MENU
  fi
  #it exists
  echo -e  "\nPlease give your phone number! "
  read CUSTOMER_PHONE
  IS_CUSTOMER_EXIST=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  #if customer is not in the database yet based on their phone number
  if [[ -z $IS_CUSTOMER_EXIST ]]
  then
    #probably inserting and asking for their name
    echo -e "\nPlease give us your name!\n"
    read CUSTOMER_NAME

    INSERT_CUSTOMER_TO_CUSTOMERS=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  echo -e "\nPLease give the time"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  INSRET_APPOINTMENT=$($PSQL "insert into appointments(service_id, customer_id, time) values($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."


  



fi