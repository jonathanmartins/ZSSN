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

Data Params:
```
{
    "name":[string],
    "age":[integer],
    "gender":[male or female],
    "latitude":[decimal],
    "longitude":[decimal],
    "water":[integer],
    "food":[integer],
    "medication":[integer],
    "ammunition":[integer]
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

URL: /survivor/:id/report_infected

Method: GET

URL Params: id=[integer]

Success Response:
```
  Code: 200
  Content: survivor data
```

##Reports
	GET /infected_survivors
	GET /uninfected_survivors
