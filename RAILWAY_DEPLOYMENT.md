# Railway Deployment

**Web Service**
- Start Command: `npm run start`
- Build Command: `npm run build`
- Health Check: `/health`

**Environment Variables**
```bash
NODE_ENV=production
DATABASE_URL=${{Postgres.DATABASE_URL}}
SESSION_SECRET=your-secure-session-secret-here
ADMIN_USERNAME=admin
ADMIN_PASSWORD=your-secure-admin-password
UPLOAD_DIR=/app/uploads
```

**Database Setup**
1. Add a PostgreSQL service in Railway
2. Connect it to your web service
3. Run database migrations with: `npm run db:migrate`

**Domain**
Your app will be available at: `https://your-app-name.railway.app`