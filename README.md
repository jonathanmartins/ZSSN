# Zombie Survival Social Network

https://zssn-rails.herokuapp.com/

## End Points

###List Survivors

URL: /survivors

Method: GET

Success Response:
```
	Code: 200
	Content: list of survivors
```
###Create Survivor

URL: /survivors

Method: POST

PS: Default values in inventory are 0 for each item.

Data Params:
```
{
    "name":[string],
    "age":[integer],
    "gender":[male or female],
    "latitude":[decimal],
    "longitude":[decimal],
    "inventory": {
    	"water":[integer],
        "food":[integer],
        "medication":[integer],
        "ammunition":[integer]
    }
}
```
Success Response:
```
  Code: 201
  Content: survivor data
```
###Update Survivor Location

URL: /survivors/:id

Method: PATCH / PUT

URL Params: id=[integer]

PS: When updating, you have to edit both attributes.

Data Params:
```
{
    "latitude":[decimal],
    "longitude":[decimal]
}
```
Success Response:
```
  Code: 200
  Content: survivor data
```
###Show Survivor

URL: /survivors/:id

Method: GET

URL Params: id=[integer]

Success Response:
```
  Code: 200
  Content: survivor data
```

###Report Survivor as Infected

After 3 reports, survivor becomes infected.

URL: /survivor/:id/report_infected

Method: GET

URL Params: id=[integer]

Success Response:
```
  Code: 200
  Content: survivor data
```

###Trade between 2 survivors

URL: /trade/:survivor_one_id/with/:survivor_two_id

Method: POST

URL Params: survivor_one_id=[integer], survivor_two_id=[integer]

PS: Offered items originates from survivor_one, wanted items originates from survivor_two

Data Params:
```
{
	"offered": {
	    "water":[integer],
	    "food":[integer],
	    "medication":[integer],
	    "ammunition":[integer]
	},
	"wanted": {
		"water":[integer],
		"food":[integer],
		"medication":[integer],
		"ammunition":[integer]
	}
}
```
Success Response:
```
  Code: 200
  Content: String
```
##Reports
	GET /infected_survivors
	GET /uninfected_survivors
	GET /points_lost
