CREATE TABLE keywords (
    id SERIAL PRIMARY KEY,
    keyword TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    keyword TEXT NOT NULL,
    content_path TEXT,
    image_path TEXT,
    status VARCHAR(20) DEFAULT 'draft',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);