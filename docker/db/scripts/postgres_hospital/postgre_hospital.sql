CREATE SCHEMA Hospital

CREATE TABLE Hospital.Station(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE Hospital.Room(
    id SERIAL PRIMARY KEY,
    station_id INTEGER REFERENCES Hospital.Station (id),
    beds TEXT
);

CREATE TABLE Hospital.Station_Personnel(
    id SERIAL PRIMARY KEY,
    station_id INTEGER REFERENCES Hospital.Station (id),
    name TEXT
);

CREATE TABLE Hospital.Doctor(
    id SERIAL PRIMARY KEY REFERENCES Hospital.Station_Personnel (id),

    rank TEXT,
    area TEXT
);

CREATE TABLE Hospital.Patient(
  id SERIAL PRIMARY KEY,
  name TEXT,
  illness TEXT,

  doctor_id INTEGER REFERENCES Hospital.Doctor (id)
);

CREATE TABLE Hospital.Admission (
    patient_id INTEGER REFERENCES Hospital.Patient(id),
    from_room_id INTEGER REFERENCES Hospital.Room (id),
    to_room_id INTEGER REFERENCES Hospital.Room (id)
);

CREATE TABLE Hospital.Caregiver(
    id SERIAL PRIMARY KEY REFERENCES Hospital.Station_Personnel (id),

    qualification TEXT
);