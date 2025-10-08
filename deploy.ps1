# Quick Railway Deployment Script - PowerShell
Write-Host "🚀 Starting Railway deployment..." -ForegroundColor Green

# Check if Railway CLI is installed
try {
    railway --version | Out-Null
} catch {
    Write-Host "❌ Railway CLI not found. Installing..." -ForegroundColor Red
    npm install -g @railway/cli
}

# Build the application
Write-Host "🔧 Building application..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

# Deploy to Railway
Write-Host "🚄 Deploying to Railway..." -ForegroundColor Blue
railway up

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Deployment successful!" -ForegroundColor Green
    Write-Host "📊 Run migrations with: railway run npm run db:migrate" -ForegroundColor Cyan
    Write-Host "🌐 Check your app status: railway status" -ForegroundColor Cyan
    Write-Host "📜 View logs: railway logs" -ForegroundColor Cyan
} else {
    Write-Host "❌ Deployment failed!" -ForegroundColor Red
    exit 1
}