#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

#List of services
MAIN_MENU(){
  echo -e "\nChoose out of the following services:"
  echo -e "\n1) Haircut\n2) Color\n3) Perm\n4) Style\n5) Trim"
  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED > 5 || $SERVICE_ID_SELECTED < 1 ]]
  then
   MAIN_MENU "Invalid service selected"
   fi
}

MAIN_MENU "Welcome to My Salon"

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

echo -e "\nEnter phone number: "
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
echo -e "\nNew User:\nWhat is your name: "
read CUSTOMER_NAME
INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
echo -e "\nEnter appointment time: "
read SERVICE_TIME

INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME',$CUSTOMER_ID, $SERVICE_ID_SELECTED)")
echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
