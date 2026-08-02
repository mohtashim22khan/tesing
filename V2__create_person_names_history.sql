CREATE TABLE person_names_history (
    history_id BIGSERIAL PRIMARY KEY,
    id BIGINT NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    changed_at TIMESTAMP NOT NULL DEFAULT now(),
    changed_by VARCHAR(100)
);

ALTER TABLE person_names ADD COLUMN placeholder_for_history_sync BOOLEAN DEFAULT false;
ALTER TABLE person_names_history ADD COLUMN placeholder_for_history_sync BOOLEAN DEFAULT false;
