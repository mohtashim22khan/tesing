CREATE TABLE inventory (
    id BIGSERIAL PRIMARY KEY,
    warehouse VARCHAR(100) NOT NULL,
    product_sku VARCHAR(50) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    UNIQUE (warehouse, product_sku)
);

CREATE OR REPLACE FUNCTION trg_prevent_negative_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity < 0 THEN
        RAISE EXCEPTION 'Inventory quantity cannot be negative for %', NEW.product_sku;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_negative_stock
    BEFORE INSERT OR UPDATE ON inventory
    FOR EACH ROW
    EXECUTE FUNCTION trg_prevent_negative_stock();
