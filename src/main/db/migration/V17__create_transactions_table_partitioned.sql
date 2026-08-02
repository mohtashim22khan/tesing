CREATE TABLE transactions (
    id BIGSERIAL,
    account_id BIGINT NOT NULL,
    amount NUMERIC(14, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    PRIMARY KEY (id, transaction_date)
) PARTITION BY RANGE (transaction_date);

CREATE TABLE transactions_2026_q1 PARTITION OF transactions
    FOR VALUES FROM ('2026-01-01') TO ('2026-04-01');

CREATE TABLE transactions_2026_q2 PARTITION OF transactions
    FOR VALUES FROM ('2026-04-01') TO ('2026-07-01');
