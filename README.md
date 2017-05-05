# ANURAG_KUMAR_490_MAVEN_techtonics

Documentation: 
---------------------
Mini Project on "TechTonics WebApp for ATMECS Passionate Minds"
Platform: JAVA 1.7
BuildTool: Apache MAVEN
Date: 4th May 2017
git-repo: https://github.com/anuragkumar490/ANURAG_KUMAR_490_MAVEN_techtonics.git

Submitted By:
--------------
ANURAG KLUMAR (Batch 2)
EMP_ID: 490

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DATABSE: REFER TO "DB_TABLES_SCRIPT.SQL" FILE FOR COMMANDS
--------
NOTE:
-----
======================================================
You can BUILD SAMPLE TABLE by running "DB_TABLES_SCRIPT.SQL" SCRIPT FILE.

e.g., RUN THE COMMAND FROM YOUR MYSQL CONSOLE AFTER LOGIN:

mysql> SOURCE C:\SQL_SCRIPTS\DB_TABLES_SCRIPT.SQL
======================================================

MySQL
-----
Required JAR:  mysql-connector-java-5.0.5-bin.jar
-------------

DB SCHEMA: atmecs
----------
DB TABLES:
----------
1. users
2. techtonics
3. registered
4. requests


TABLE DESC:
-----------

1. USERS:
---------

+----------+------------------+------+-----+---------+----------------+
| Field    | Type             | Null | Key | Default | Extra          |
+----------+------------------+------+-----+---------+----------------+
| srno     | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name     | varchar(45)      | NO   |     |         |                |
| email    | varchar(50)      | NO   | MUL |         |                |
| password | varchar(45)      | NO   |     |         |                |
+----------+------------------+------+-----+---------+----------------+

// Creating Index on `atmecs`.`Users`.`email`: Required for creating reference
NOTE:
-----
When creating a foreign key constraint,
MySQL requires a usable index on both the referencing table and also on the referenced table.
The index on the referencing table is created automatically if one doesn't exist,
but the one on the referenced table needs to be created manually.
---------------------------------------------------------------------

CREATE INDEX ix_email_id ON `atmecs`.`Users` (email);

---------------------------------------------------------------------


2. TECHTONICS:
--------------
+-------------+------------------+------+-----+---------+----------------+
| Field       | Type             | Null | Key | Default | Extra          |
+-------------+------------------+------+-----+---------+----------------+
| id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| date        | datetime         | NO   |     |         |                |
| title       | varchar(50)      | NO   |     |         |                |
| description | varchar(150)     | NO   |     |         |                |
| presenter   | varchar(50)      | NO   |     |         |                |
+-------------+------------------+------+-----+---------+----------------+


---------------------------------------------------------------------

3. REGISTERED:
--------------
+--------+------------------+------+-----+---------+-------+
| Field  | Type             | Null | Key | Default | Extra |
+--------+------------------+------+-----+---------+-------+
| reg_id | int(10) unsigned | NO   | PRI |         |       |
| email  | varchar(50)      | NO   | PRI |         |       |
+--------+------------------+------+-----+---------+-------+

----------------------------------------------------------------------

4. REQUESTS:
------------
+--------+------------------+------+-----+---------+----------------+
| Field  | Type             | Null | Key | Default | Extra          |
+--------+------------------+------+-----+---------+----------------+
| req_id | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| date   | date             | NO   |     |         |                |
| topic  | varchar(50)      | NO   |     |         |                |
| email  | varchar(50)      | NO   | MUL |         |                |
| status | varchar(20)      | NO   |     | pending |                |
+--------+------------------+------+-----+---------+----------------+
---------------------------------------------------------------------
==========================================================================


==========================================================================

MODEL CLASSES:
--------------
1. User: to store user's info
-------------------------------------------
	Attributes:
	-----------
	private String name;
	private String email;
	private String password;
	
	Behaviours:
	-----------
	getters and setters
	
	
	Overridden Methods:
	-------------------
	toString(): 
	
2. TechTalk: to store techtalk's info
-------------------------------------------
	Attributes:
	-----------
	private int id;
	private String date;
	private String title;
	private String description;
	private String presenter;
	
	Behaviours:
	-----------
	getters and setters
	
	
	Overridden Methods:
	-------------------
	toString(): 
	
3. TalkRequest: to store techtalk requests made by users
-------------------------------------------
	Attributes:
	-----------
	private String reqId;
	private String date;
	private String topic;
	private String email;
	private String status;
	
	Behaviours:
	-----------
	getters and setters
	
	
	Overridden Methods:
	-------------------
	toString(): 

--------------------------------------------------------------------
--------------------------------------------------------------------


CONTROLLER CLASSES: (Servlets)
-------------------

1. Login.java:
--------------
	Authenticate the user:
	----------------------
	OnSuccess: Admin Portal/ User portal
	OnFailure: Redirects to the Login page with an error message

2. Register.java:
-----------------
	Register a New User:
	--------------------
	NOTE:
	-----
	======================================================================
	To REGISTER AS an ADMIN: GIVE YOUR EMAIL as "anurag.kumar@atmecs.com"
	PASSWORD: 1234 (if you refer to the sample entry for the `users` table)
	======================================================================
	
	
3. AddTalk.java:
-----------------
	Handles request for adding a TechTalk

4. UpdateTalk.java
------------------
	Handles request for updating a TechTalk

5. DeleteTalk.java
------------------
	Handles request for deleting a TechTalk

6. GetTechTalks.java
--------------------
	Handles request for fetching all upcoming TechTalk info

7. RegisterTalk.java
--------------------
	Handles user's request for registration for a Particular TechTalk
	
8. FetchRegistration.java
-------------------------
	Handles request for fetching all the users who have registered for a particular TechTalk

9. MakeRequest.java
-------------------
	Handles user's request for a TechTalk
	
10. FetchRequests.java
----------------------
	Handles request for fetching the "TechTalk's request"

11. ApproveRequest.java
-----------------------
	Handles request for approving a TechTalk's request

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	
	
DATA ACCESS OBJECT: DAO
-------------------

1. DAO.java: Handles database
------------
	Methods:
	--------
	1. getConnection():
	-------------------
		establish connection to the MySQL DB
		
	2. addUser(User user):
	----------------------
		adds user to `users` table in the database
		
	3. isUserExist(User user):
	--------------------------
		checks whether a user already exists or not in the table
	
	4. authenticateUser(String email, String passwd):
	-------------------------------------------------
		returns a User object when an entry is found in the table
	
	5. addNewTalk(TechTalk techTalk):
	---------------------------------
		makes a TechTalk entry in the `techtonics` table
		
	6. fetchAllTechTalks():
	-----------------------
		retrieves all upcoming tech talks from the table and returns them as a List
		
	7. getTechTalk(String):
	-----------------------
		 return tech talk info as an object with the given id
	
	8. updateTalk(TechTalk):
	------------------------
		update the details of the tech talk record matched with the id of passed TechTalk object
	
	9. registerTechTalk(String, String):
	------------------------------------
		registers a user for a tech talk by making an entry in the `registered` table
	
	10. fethRegistration(String):
	-----------------------------
		get all the registered users for the given talkId and returns them as a List
		
	11. fetchMyRegistartion(String):
	--------------------------------
		fetches the techtalks registered by user and returns them by making a List of their ids
	
	12. unregisterTechTalk(String, String):
	---------------------------------------
		unregisters the techtalk for the user by removing the corresponding entry in the `registered` table
	
	13. deleteTechTalk(String):
	---------------------------
		deletes the tech talk with the given id from the `techtonics` table
	
	14. makeRequest(String, String):
	--------------------------------
		makes a request for a TechTalk by making an entry in the `requests` table
	
	15. fetchMyRequests(String):
	----------------------------
		gets the requests made by the user for the TechTalks and returns them as a List
	
	16. fetchAllRequests():
	-----------------------
		fetch all users' requests for TechTalks and returns them as a List
	
	17. approveRequest(String):
	---------------------------
		set the `atmecs`.`requests`.`status` field to 'approved'
	
	

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

VIEWS: (JSPs)
------

1. index.jsp:
--------------
 Welcome Page-Asks the user to login or signup

2. signup.jsp:
---------------
 Gets the required info from the user to create an account

3. register_success.jsp:
-------------------------
 Success page on completion of registration-Asks the user to login

4. admin_dashboard.jsp:
-----------------------
 Options for Admin:
 ------------------
	a) View All upcoming TechTalks: can also filter them by their title
	b) Add TechTalk,
	c) Edit TechTalk,
	d) View registrations for a TechTalk,
	e) Delete TechTalk,
	f) See Requests for TechTalks and Approve,
	g) Logout

 
5. add_techevent.jsp:
---------------------
 Gets the details for a TechTalk

6. user_dashboard.jsp:
----------------------
 Options for User:
 -----------------
	a) View all upcoming TechTalks: can also filter them by their title,
	b) Register/ Unregister for a TechTalk,
	c) Make Request for a TechTalk and See its status,
	d) Logout

7. logout.jsp:
--------------
 Logout page-with an option to login again

--------------------------------------------------------------------



THANK YOU:)

