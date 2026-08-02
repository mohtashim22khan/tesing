CREATE EXTENSION IF NOT EXISTS btree_gist;

CREATE TABLE subscriptions (
    id BIGSERIAL PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    plan_name VARCHAR(50) NOT NULL,
    active_period DATERANGE NOT NULL,
    EXCLUDE USING GIST (customer_id WITH =, active_period WITH &&)
);
