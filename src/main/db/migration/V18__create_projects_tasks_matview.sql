CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE project_tasks (
    id BIGSERIAL PRIMARY KEY,
    project_id INT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    is_done BOOLEAN NOT NULL DEFAULT false
);

CREATE MATERIALIZED VIEW project_task_summary AS
SELECT
    p.id AS project_id,
    p.name,
    COUNT(t.id) AS total_tasks,
    COUNT(t.id) FILTER (WHERE t.is_done) AS completed_tasks
FROM projects p
LEFT JOIN project_tasks t ON t.project_id = p.id
GROUP BY p.id, p.name
WITH DATA;

CREATE UNIQUE INDEX idx_project_task_summary_project_id
    ON project_task_summary (project_id);
