USE Hospital ; 

-- Insert Patients
INSERT INTO Patient VALUES (1,'Walter White', '308 Negra Arroyo Lane, Albuquerque, New Mexico','3129992222' ) ; 
INSERT INTO Patient VALUES (2,'Sherlock Holmes', '221B Baker St., London', '3224443232');
INSERT INTO Patient VALUES (3,'Spongebob Squarepants', '124 Conch Street, Bikini Bottom, Pacific Ocean','3224201999');
INSERT INTO Patient VALUES (4, 'Bruce Wayne', '1007 Mountain Drive, Gotham', '3125256745');
INSERT INTO Patient VALUES (5,'Barney Stinson', 'East 84th Street and 3rd Avenue Manhattan, New York', '3126916665');
INSERT INTO Patient VALUES (6,'Tom Cruise', 'Scientology Building', '3122323232');

-- Insert Physicians 
INSERT INTO Physician VALUES (12,'Drew Shulman', '12345', 'Pulmonologist', '698 Candlewood Lane, Cabot Cove, Mainee', '3215551234');
INSERT INTO Physician VALUES (22,'Fulton Reed', '54321', 'Ophthalmology', '789 Fulton Ave, Greektown', '3815559876');
INSERT INTO Physician VALUES (32,'Troy Lilis', '67890', 'Neurology', '313 Mockingbird Lane, Mockingbird Heights', '3595555678');
INSERT INTO Physician VALUES (42,'Mitchel Reckinger', '09876', 'Cardiology', '52 Festive Road, Putney, London', '3625554567');
INSERT INTO Physician VALUES (52,'Shannon Theys', '65432', 'Orthopedics', '9764 Jeopardy Lane, Chicago, Illinois', '3215552345');

-- Insert Nurses
INSERT INTO Nurse VALUES (13,'Kelly John', '12345', '62 West Wallaby Street, Wigan, Lancashire', '3123472992');
INSERT INTO Nurse VALUES (23,'John Kelly', '67890', '31 Spooner Street, Quahog, Rhode Island', '3224828572');
INSERT INTO Nurse VALUES (33,'Ariana Newton', '54321', '7 Cherry Tree Lane, London', '3204389483');
INSERT INTO Nurse VALUES (43,'Sam Smith', '09876', '30 St Mary Axe, London', '3334445555');
INSERT INTO Nurse VALUES (53,'Adam West', '65432', '742 Evergreen Terrace, Springfield', '3344556677');


-- Insert Health Records
INSERT INTO Health_record VALUES (1,1,'Lung Cancer','2023-07-15','active','patient has Lung Cancer'); 
INSERT INTO Health_record VALUES (2,2,'Heart Problems','2023-07-16','cured','Patient had heart problems');
INSERT INTO Health_record VALUES (3,3,'Brain Problem', '2023-07-17','active','Patient has lost brain cells');
INSERT INTO Health_record VALUES (4,4,'Leg Injury','2023-07-18','active','Patient has a leg injury');
INSERT INTO Health_record VALUES (5,5,'Food poisioning','2023-07-19','cured','Patient had food poisioning');
INSERT INTO Health_record VALUES (6,6,'Kidney failure','2023-07-15','cured','patient has good kidneys now'); 
-- INSERT Rooms 
INSERT INTO Room VALUES (11, 3, 150.00);
INSERT INTO Room VALUES (12, 3, 100.00);
INSERT INTO Room VALUES (31, 5, 250.00);
INSERT INTO Room VALUES (22, 4, 180.00);
INSERT INTO Room VALUES (21, 4, 200.00);

-- INSERT Hospitalized 
INSERT INTO Hospitalized VALUES (1,11,10);
INSERT INTO Hospitalized VALUES (2,12,9);
INSERT INTO Hospitalized VALUES (3,31,8);
INSERT INTO Hospitalized VALUES (4,22,7);
INSERT INTO Hospitalized VALUES (5,21,6);

-- INSERT Monitor 
INSERT INTO Monitor VALUES (1,12,10); 
INSERT INTO Monitor VALUES (2,22,9);
INSERT INTO Monitor VALUES (3,32,8);
INSERT INTO Monitor VALUES (4,42,7);
INSERT INTO Monitor VALUES (5,52,6);
INSERT INTO Monitor VALUES (6,12,10) ; 

 
 -- INSERT Instructions 
 INSERT INTO Instructions VALUES (1002,12,1000,'Chemo'); 
 INSERT INTO Instructions VALUES (2002,22,2000,'surgery'); 
 INSERT INTO Instructions VALUES (3002,32,750,'CT Scan'); 
 INSERT INTO Instructions VALUES (4002,42,800,'Xray scan'); 
 INSERT INTO Instructions VALUES (5002,52,900,'Collect Samples'); 

 -- INSERT Execute_Orders
INSERT INTO Execute_Orders VALUES (13,1002,1,'2023-07-15','pending') ; 
INSERT INTO Execute_Orders VALUES (23,1002,1,'2023-07-16','done') ;
INSERT INTO Execute_Orders VALUES (33,3002,3,'2023-07-17','pending') ;   
INSERT INTO Execute_Orders VALUES (43,4002,4,'2023-07-18','done') ;   
INSERT INTO Execute_Orders VALUES (53,5002,5,'2023-07-19','pending') ; 
INSERT INTO Execute_Orders VALUES (33,1002,1,'2023-07-15','pending') ; 
INSERT INTO Execute_Orders VALUES (53,1002,1,'2023-07-15','pending') ; 
  
 
 -- INSERT Medication 
INSERT INTO Medication VALUES (1,'Tylenol',13,'50mg');
INSERT INTO Medication VALUES (1,'Ibuprophen',23,'50mg');
INSERT INTO Medication VALUES (3,'Panadol',33,'50mg');
INSERT INTO Medication VALUES (1,'Panadol',13,'50mg');
INSERT INTO Medication VALUES (5,'Aspirin',53,'50mg'); 
 
 -- INSERT Payment
 INSERT INTO Payment VALUES (111,1,11,1002,1000,1500,'2023-12-31',2500);
 INSERT INTO Payment VALUES (222,2,12,2002,2000,900,'2023-12-31',2900);
 INSERT INTO Payment VALUES (333,3,31,3002,750,2000,'2023-12-31',2750); 
 INSERT INTO Payment VALUES (444,4,22,4002,800,1260,'2023-12-31',2060);
 INSERT INTO Payment VALUES (555,5,21,5002,900,1200,'2023-12-31',2100);