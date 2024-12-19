# Ticket System

> The is the backend programming for the ticket app and is intended to be used along side one another 
[Ticket System Frontend - Github](https://github.com/joshmoran/ticket-system-frontend)

# Index 
1. Getting started with this project 
2. Overview and features 

# 1. Getting started with the project 
To successfully run the program, please follow these steps:
1. Import 'ticketsystem.sql' into a SQL engine
   - This will create the database, tables and all data 
2. Use authentication on the database (varies based on the SQL provider)  
3. rename 'env-template.txt' to '.env'
3. Edit and change the '.env' file to the desired values
   - PORT = The host port for the backend app to run on 
   - HOST = Host of the SQL server
   - DATABASE = The database name for the SQL server (most likely from the SQL file is ticketsystem)
   - USER = The username to authenticate the user with the database
   - PASSWORD = The password to authenticate the user with the database
4. Run the script by 'node server.js'

# 2. Overview and features 
## Overview 
- This app is used along side the front end, to query, get, post or any other method of give or receiver data from a database
- Creates an API for the frontend to use and creates enough functions and API calls to create a full-stack dynamic application

## Features 

> This is an outline for the possible functions that it can perform

| Function Name |  Method | Reason |
|:---:|:---:|:---:|
| /ticket | POST | Insert ticket |
| /ticket/{id} | PUT | Update a ticket |
| /ticket/{id} | DELETE | Delete a ticket |
| /ticket/{id} | GET | Select a ticket |
| /message | POST | Insert a message |
| /message/{id} | GET | Get messages for a ticket |
| /change/{id}/{status} | GET | Update a tickets status |
| /all | GET | Get Every Ticket |
| /pending | GET | Get pending tickets |
| /pending/{column}/{method} | GET | Get pending tickets, in order to sort them |
| /completed | GET | Get all completed tickets |
| /completed/{column}/{method} | GET | Get completed tickets, in order to sort them |
