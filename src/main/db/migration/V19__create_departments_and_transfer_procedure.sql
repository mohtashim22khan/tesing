CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    budget NUMERIC(14, 2) NOT NULL DEFAULT 0
);

ALTER TABLE employees ADD COLUMN department_id INT REFERENCES departments (id);

CREATE OR REPLACE PROCEDURE transfer_employee(
    p_employee_id BIGINT,
    p_new_department_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET department_id = p_new_department_id
    WHERE id = p_employee_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Employee % not found', p_employee_id;
    END IF;
END;
$$;
