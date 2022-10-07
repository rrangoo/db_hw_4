CREATE SCHEMA Station

CREATE TABLE Station.City (
    name TEXT,
    region TEXT,

    PRIMARY KEY (name, region)
);

CREATE TABLE Station.Station (
    id SERIAL PRIMARY KEY,
    name TEXT,
    tracks TEXT,

    city_name TEXT,
    city_region TEXT,

    FOREIGN KEY (city_name, city_region) REFERENCES Station.City (name, region)
);

CREATE TABLE Station.Train (
    id SERIAL PRIMARY KEY,
    length INTEGER,

    start_station_id INTEGER REFERENCES Station.Station (id),
    end_station_id INTEGER REFERENCES Station.Station (id)
);

CREATE TABLE Station.Connection (
    train_id INTEGER REFERENCES Station.Train (id),
    departure TIME,
    arrival TIME,

    from_station_id INTEGER REFERENCES Station.Station (id),
    to_station_id INTEGER REFERENCES Station.Station (id),

    PRIMARY KEY (train_id, from_station_id, to_station_id)
);