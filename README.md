# 🔧 Mechanik - Chat z Mechanikiem

Profesjonalna aplikacja do komunikacji z mechanikami samochodowymi online. Pełny stack aplikacji z React, Express, PostgreSQL i integracją płatności.

## 🚀 Funkcjonalności

### 🎯 Dla Użytkowników
- **Chat w czasie rzeczywistym** z certyfikowanymi mechanikami
- **Wybór pojazdu** - szczegółowe dane techniczne
- **Przesyłanie zdjęć** problemów z samochodem
- **System płatności** - PayPal i Stripe
- **Historia rozmów** - dostęp do poprzednich konsultacji
- **Responsywny design** - działa na wszystkich urządzeniach

### ⚙️ Dla Mechaników (Panel Admin)
- **Zarządzanie użytkownikami** i weryfikacja mechaników
- **Monitorowanie chatu** w czasie rzeczywistym
- **System powiadomień** - email i w aplikacji
- **Statystyki** i raporty aktywności
- **Zarządzanie subskrypcjami** użytkowników

## 🛠️ Stack Technologiczny

### Frontend
- **React 18** + TypeScript
- **Tailwind CSS** + Radix UI
- **Framer Motion** - animacje
- **React Query** - state management
- **Wouter** - routing

### Backend
- **Express.js** + TypeScript
- **PostgreSQL** + Drizzle ORM
- **WebSocket** - chat w czasie rzeczywistym
- **Session-based auth** + bcrypt
- **Helmet** - security headers

### Integracje
- **PayPal SDK** - płatności
- **Stripe** - alternatywne płatności
- **Nodemailer** - powiadomienia email
- **OpenAI API** - opcjonalne AI assistance
- **Multer** - upload plików

### DevOps & Deployment
- **Railway** - hosting i deployment
- **Docker** support
- **Drizzle Kit** - migracje bazy danych
- **ESBuild** + Vite - build tools

## 🏃‍♂️ Szybki Start

### Lokalne uruchomienie

```bash
# 1. Klonowanie repo
git clone https://github.com/twój-username/mechanik.git
cd mechanik

# 2. Instalacja zależności
npm install

# 3. Konfiguracja środowiska
cp .env.example .env
# Uzupełnij zmienne w .env

# 4. Uruchomienie bazy danych (lokalne)
# Skonfiguruj PostgreSQL lokalnie lub użyj Docker

# 5. Uruchomienie migracji
npm run db:migrate

# 6. Start aplikacji
npm run dev
```

Aplikacja będzie dostępna na `http://localhost:5000`

### Domyślne dane logowania
- **Admin**: username z `ADMIN_USERNAME`, hasło z `ADMIN_PASSWORD`

## 🚄 Deployment na Railway

### Automatyczny deployment
1. Fork tego repo
2. Utwórz konto na [Railway](https://railway.app)
3. Połącz z GitHub i wybierz repo
4. Dodaj serwis PostgreSQL
5. Ustaw zmienne środowiskowe (patrz `.env.example`)
6. Deploy automatycznie się uruchomi

### Manualne deployment
```bash
# Railway CLI
npm install -g @railway/cli
railway login
railway init
railway add postgresql
railway up

# Uruchom migracje
railway run npm run db:migrate
```

Szczegółowe instrukcje: [README_RAILWAY.md](./README_RAILWAY.md)

## 📁 Struktura Projektu

```
mechanik/
├── client/                 # Frontend React
│   ├── src/
│   │   ├── components/    # Komponenty UI
│   │   ├── pages/         # Strony aplikacji
│   │   ├── hooks/         # Custom hooks
│   │   └── lib/           # Utilities
├── server/                # Backend Express
│   ├── routes.ts         # API endpoints
│   ├── db.ts             # Database connection
│   ├── storage.ts        # Data access layer
│   └── email.ts          # Email service
├── shared/               # Wspólne typy i schema
│   └── schema.ts         # Drizzle schema
├── migrations/           # Database migrations
├── uploads/              # User uploads
└── dist/                 # Production build
```

## 🗄️ Schema Bazy Danych

### Tabele
- **users** - użytkownicy systemu (admini i mechanicy)
- **chat_sessions** - sesje rozmów
- **messages** - wiadomości w chatach
- **attachments** - załączone pliki
- **subscriptions** - płatne subskrypcje

### Relacje
- User → ChatSessions (1:N)
- ChatSession → Messages (1:N)
- Message → Attachments (1:N)
- User → Subscriptions (1:N)

## 🔒 Bezpieczeństwo

- **HTTPS** automatyczne na Railway
- **Helmet** - security headers
- **Rate limiting** na API
- **Session security** - httpOnly, secure cookies
- **Password hashing** - bcrypt
- **File upload validation** - typy MIME, rozmiar
- **SQL injection protection** - Drizzle ORM

## 🔧 Konfiguracja

### Wymagane zmienne środowiskowe
```bash
DATABASE_URL=postgresql://...
SESSION_SECRET=minimum-32-znaki-bezpieczny-klucz
ADMIN_USERNAME=admin
ADMIN_PASSWORD=bezpieczne-haslo
```

### Opcjonalne integracje
```bash
# Email
SMTP_HOST=smtp.gmail.com
SMTP_USER=your-email@gmail.com
SMTP_PASS=app-password

# PayPal
PAYPAL_CLIENT_ID=...
PAYPAL_CLIENT_SECRET=...

# Stripe
STRIPE_SECRET_KEY=sk_...
STRIPE_PUBLISHABLE_KEY=pk_...

# OpenAI
OPENAI_API_KEY=sk-...
```

## 📊 Monitorowanie

### Health Checks
- `/health` - status aplikacji
- `/health/db` - status bazy danych

### Logi
- Railway Dashboard - automatyczne logi
- Console logs dla debug w development

## 🤝 Rozwój

### Skrypty npm
```bash
npm run dev          # Development server
npm run build        # Production build
npm run start        # Production server
npm run db:generate  # Generate migrations
npm run db:migrate   # Run migrations
npm run db:studio    # Drizzle Studio
```

### Git workflow
1. Feature branches z `main`
2. Pull requests dla review
3. Automatic deployment z `main` branch

## 📝 Licencja

MIT License - patrz [LICENSE](LICENSE)

## 🚀 Demo

**Live Demo**: [https://mechanik.railway.app](https://mechanik.railway.app)

---

### 👨‍💻 Autor

Stworzony z ❤️ dla społeczności mechaniów i właścicieli pojazdów.

### 🔄 Status

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Deployment](https://img.shields.io/badge/deployment-railway-blue)
![Database](https://img.shields.io/badge/database-postgresql-blue)
![Frontend](https://img.shields.io/badge/frontend-react-blue)
![Backend](https://img.shields.io/badge/backend-express-green)