CREATE TABLE keywords (
    id SERIAL PRIMARY KEY,
    keyword TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    outlines TEXT[] DEFAULT ARRAY[]::TEXT[],
    status VARCHAR(20) DEFAULT 'draft',
    content_path TEXT,
    image_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);