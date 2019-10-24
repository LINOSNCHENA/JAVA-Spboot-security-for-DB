# SECURITY FOR CLIENTS
Import the project to the IDE of your choosing as a Maven project.
 
## Run application

To run the application in development time, start ther SERVER, and then enter the following Maven command:  
```
mvn spring-boot:run
```

Open [http://localhost:8080/](http://localhost:8080/) in browser to see the application.


## List of the four endpoints of the application

1. Register users
2. login for users
3. login for admins
4. login for everyone

Two tables created; table 1 is the the list of users, and table 2 for the classification of types of  users. Password is automatically masked by the springboot security API