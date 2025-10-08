#!/bin/bash

# Quick Railway Deployment Script

echo "🚀 Starting Railway deployment..."

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI not found. Installing..."
    npm install -g @railway/cli
fi

# Build the application
echo "🔧 Building application..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

# Deploy to Railway
echo "🚄 Deploying to Railway..."
railway up

if [ $? -eq 0 ]; then
    echo "✅ Deployment successful!"
    echo "📊 Run migrations with: railway run npm run db:migrate"
    echo "🌐 Check your app status: railway status"
    echo "📜 View logs: railway logs"
else
    echo "❌ Deployment failed!"
    exit 1
fi