CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS phone_numbers;
DROP TABLE IF EXISTS people;

CREATE TABLE IF NOT EXISTS people (
    id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

COMMENT ON TABLE people IS 'List of people';
COMMENT ON COLUMN people.first_name IS 'Bob';

CREATE TABLE IF NOT EXISTS phone_numbers (
    id uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
    people_id uuid NOT NULL,

    number text NOT NULL,
    type text NOT NULL,

    FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE ON UPDATE CASCADE
);

COMMENT ON TABLE phone_numbers IS 'Phone numbers for each person';
COMMENT ON COLUMN phone_numbers.type IS 'e.g. home/mobile/work/fax/other';
