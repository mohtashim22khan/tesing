CREATE TABLE person_names (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    created_by VARCHAR(100),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_by VARCHAR(100)
);

CREATE INDEX idx_person_names_last_name ON person_names (last_name);
