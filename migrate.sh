#!/bin/bash

# Railway Migration Script
echo "Starting database migration..."

# Check if DATABASE_URL is set
if [ -z "$DATABASE_URL" ]; then
    echo "Error: DATABASE_URL environment variable is not set"
    exit 1
fi

# Run migrations
echo "Running Drizzle migrations..."
npm run db:migrate

if [ $? -eq 0 ]; then
    echo "Migrations completed successfully!"
else
    echo "Migration failed!"
    exit 1
fi