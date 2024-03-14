This database has been created for a Catering service for specialized diets. 

A few factors to note are below.

FLEXIBILITY: The database has been designed for flexibility. It allows the business to create new diet types and plan meals accordingly. Meal composition is also made quite granular so it is fully customizable. Meal delivery is also flexible as multiple addresses can be accommodated. Additionally, history of changes in plans and addresses will be stored efficiently.

GROWTH: The table structure is quite normalized which allows growth without affecting performance while querying and processing the data. Also, relevant lookup (reference) tables can be expanded for higher business agility.

SUBJECT MATTER EXPERTISE: Medical and nutritional information about the menu items have not been accomodated here as a deliberate exclusion. The business will be employing their own dietician for these details as per the business vision and target markets.

The main entities (tables) in the structure are: Clients, Address, Plan and Meal

Some possible values for Reference (Lookup) Tables are as below:

ClientType:		Prospect,	Trial,	Individual,	Corporate	Staff	
PlanType:		Paleo,	Keto,	Diabetic,	Low Carb,	Bland,	Child
PlanRestriction:	Kosher,	Vegetarian,	Halal,	Vegan		
AddressType:		Personal	Mailing	Corporate	Temporary		


Some possible values for fields within the tables:

Marital_Status:		Common Law,	Married,	Single,	Divorced,	Widowed
Autorenew:		Yes,	No			
Plan_Frequency:		Daily,	Weekdays,	Weekends		
Plan_Delivery Mode:	Pickup,	Delivery			
Plan_Duration:		Annual,	Quarterly,	Monthly,	Weekly	
Plan_Status:		Active,	Expired,	Aborted,	Renewed	
Meal_Schedule Status:	Scheduled,	Completed,	Cancelled
