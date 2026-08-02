CREATE TABLE invoices (
    id BIGSERIAL PRIMARY KEY,
    invoice_number VARCHAR(30) NOT NULL UNIQUE,
    subtotal NUMERIC(12, 2) NOT NULL,
    tax_rate NUMERIC(5, 4) NOT NULL DEFAULT 0.0,
    total_amount NUMERIC(12, 2) GENERATED ALWAYS AS (subtotal * (1 + tax_rate)) STORED,
    issued_at DATE NOT NULL DEFAULT CURRENT_DATE
);
