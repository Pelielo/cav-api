<h1 align="center">
	<br>
		CAV API
	<br>
</h1>

###

`cav-api` is a RESTful API written in [`Elixir`](https://elixir-lang.org/) designed to work as a CRUD for scheduling visits and inspections of vehicles.

## Setup

After cloning the repository, run the following commands in a Linux environment:

```bash

# Make run.sh executable
chmod +x run.sh

# Use docker-compose to initiate the server
docker-compose up -d
```

## Running

The included `docker-compose.yml` file runs 2 docker containers:

1. A [PostgreSQL](https://www.postgresql.org/) database to store information regarding CAV locations as well as scheduling procedures.
2. An API server receiving requests via **port 4000** with 4 routes:
   1. `GET /cav` - Returns all existing CAVs and their names.
   2. `GET /cav/<cav_id>?procedure=<visit|inspection>&date=<date>` - Returns the available hours for scheduling a visit or an inspection for a given CAV in a given date.
   3. `POST /cav/<cav_id>/inspection` - Schedules an inspection using the following body as example: `{"date": "2019-08-24", "hour": 10, "car_id": 1}`.
   4. `POST /cav/<cav_id>/visit` - Schedules a visit using the following body as example: `{"date": "2019-08-24", "hour": 10, "car_id": 1}`.

There is also a [Postman collection](./docs/postman_collection.json) to import and use.