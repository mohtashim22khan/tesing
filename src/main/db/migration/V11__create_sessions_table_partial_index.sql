CREATE TABLE sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id BIGINT NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    revoked BOOLEAN NOT NULL DEFAULT false
);

-- Only index sessions that are still valid, to keep lookups fast
CREATE INDEX idx_sessions_active
    ON sessions (user_id)
    WHERE revoked = false;
