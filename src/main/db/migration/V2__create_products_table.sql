CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    sku VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(200) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    CONSTRAINT chk_products_price_positive CHECK (price >= 0),
    CONSTRAINT chk_products_stock_non_negative CHECK (stock_quantity >= 0)
);
