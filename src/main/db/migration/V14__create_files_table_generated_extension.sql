CREATE TABLE files (
    id BIGSERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    file_extension VARCHAR(20) GENERATED ALWAYS AS (
        LOWER(SUBSTRING(file_name FROM '\.([^.]+)$'))
    ) STORED,
    size_bytes BIGINT NOT NULL CHECK (size_bytes >= 0),
    uploaded_at TIMESTAMP NOT NULL DEFAULT now()
);
