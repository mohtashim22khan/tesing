CREATE TABLE employees (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE,
    manager_id BIGINT REFERENCES employees (id)
);

CREATE INDEX idx_employees_manager_id ON employees (manager_id);
