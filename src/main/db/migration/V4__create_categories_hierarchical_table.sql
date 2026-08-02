CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INT REFERENCES categories (id) ON DELETE CASCADE,
    UNIQUE (name, parent_id)
);

-- Root categories have NULL parent_id
INSERT INTO categories (name, parent_id) VALUES ('Electronics', NULL);
