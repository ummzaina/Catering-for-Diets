This database has been created for a Catering service for specialized diets. 

A few factors to note are below.

Flexibility: The database has been designed for flexibility. It allows the business to create new diet types and plan meals accordingly. Meal composition is also made quite granular so it is fully customizable. Meal delivery is also flexible as multiple addresses can be accommodated. Additionally, history of changes in plans and addresses will be stored efficiently.

Growth: The table structure is quite normalized which allows growth without affecting performance while querying and processing the data. Also, relevant lookup (reference) tables can be expanded for higher business agility.

Subject Matter Knowledge: Medical and nutritional information about the menu items have not been designed her as a deliberate exclusion as the business can employ their own dietician for these details.

The main entities (tables) in the structure are: Clients, Address, Plan and Meal

Some possible values for Reference (Lookup) Tables are as below:

ClientType:	Prospect,	Trial,	Individual,	Corporate	Staff	
PlanType:	Paleo,	Keto,	Diabetic,	Low Carb,	Bland,	Child
PlanRestriction:	Kosher,	Vegetarian,	Halal,	Vegan		
AddressType:	Personal	Mailing	Corporate	Temporary		


Some possible values for fields within the tables:
					
