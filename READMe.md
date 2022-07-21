#  DATA SECURITY IN SPRING-BOOT

## Run application

To run the application in development enter the following Maven command:  

```
mvn clean package
cd security1 \
mvn spring-boot:run
```

## Links

Open [http://localhost:8081/](http://localhost:8081/) in browser to see the application.
Open [http://localhost:8081/admin](http://localhost:8081/admin) in browser to administrators.
Open [http://localhost:8081/register](http://localhost:8081/register) in browser to register.


## Frontend
```
Postman
```

##  Different access layers per security classification

1. Register Users/Administrators
2. Login for Administrators
3. Login for users
4. Login for public

Two tables were created to implement the security system’s feature; Table #1 is used to save the list of authorised users, and Table #2 is used for the classification of types of  authorised users. Password is automatically masked by the spring boot security API. A hashing algorithm encrypts the password before storage in database. Remember to fill database with at least one Admin user before using the systems, for activation purposes


## User-Interface

Below are some screens shots from the application user

![ AM#1](https://github.com/LINOSNCHENA/JAVA-Spring-Boot-security-for-databases/blob/master/UXview/page1.png)
![ AM#2 ](https://github.com/LINOSNCHENA/JAVA-Spring-Boot-security-for-databases/blob/master/UXview/page2.png)
![ AM#3 ](https://github.com/LINOSNCHENA/JAVA-Spring-Boot-security-for-databases/blob/master/UXview/page3.png)
![ AM#4 ](https://github.com/LINOSNCHENA/JAVA-Spring-Boot-security-for-databases/blob/master/UXview/page4.png)


# End
