-- PHP
-- JAVA
-- PYTHON
-- will use Node.js but could
-- use any above and more

CREATE users (
    email NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

