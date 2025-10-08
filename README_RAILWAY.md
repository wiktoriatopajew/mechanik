# Deployment na Railway - Chat with Mechanic

## 🚀 Przygotowanie do deployment

### 1. Instalacja zależności
```bash
npm install
```

### 2. Sprawdzenie build
```bash
npm run build
```

## 🚄 Deployment na Railway

### Opcja A: Railway Dashboard (Zalecane)

1. **Utworz konto na Railway**
   - Idź na https://railway.app
   - Zaloguj się przez GitHub

2. **Utwórz nowy projekt**
   - Kliknij "New Project"
   - Wybierz "Deploy from GitHub repo"
   - Wybierz swoje repozytorium

3. **Dodaj bazę danych PostgreSQL**
   - W projekcie kliknij "New"
   - Wybierz "Database" → "PostgreSQL"

4. **Skonfiguruj zmienne środowiskowe**
   W zakładce "Variables" dodaj:
   ```bash
   NODE_ENV=production
   DATABASE_URL=${{Postgres.DATABASE_URL}}
   SESSION_SECRET=twój-bezpieczny-klucz-sesji-minimum-32-znaki
   ADMIN_USERNAME=admin
   ADMIN_PASSWORD=twoje-bezpieczne-hasło-admina
   UPLOAD_DIR=/app/uploads
   ```

5. **Uruchom deployment**
   - Railway automatycznie zbuduje i wdroży aplikację
   - Po deployment uruchom migracje w konsoli Railway:
   ```bash
   npm run db:migrate
   ```

### Opcja B: Railway CLI

1. **Instalacja CLI**
   ```bash
   npm install -g @railway/cli
   ```

2. **Logowanie**
   ```bash
   railway login
   ```

3. **Inicjalizacja projektu**
   ```bash
   railway init
   ```

4. **Dodanie PostgreSQL**
   ```bash
   railway add postgresql
   ```

5. **Ustawienie zmiennych**
   ```bash
   railway vars set NODE_ENV=production
   railway vars set SESSION_SECRET=twój-bezpieczny-klucz
   railway vars set ADMIN_USERNAME=admin
   railway vars set ADMIN_PASSWORD=twoje-hasło
   railway vars set UPLOAD_DIR=/app/uploads
   ```

6. **Deploy**
   ```bash
   railway up
   ```

7. **Migracje**
   ```bash
   railway run npm run db:migrate
   ```

## 🔧 Konfiguracja po deployment

### Sprawdzenie statusu
- Health check: `https://twoja-app.railway.app/health`
- Database check: `https://twoja-app.railway.app/health/db`

### Logowanie jako admin
1. Idź na `https://twoja-app.railway.app`
2. Użyj danych ustawionych w `ADMIN_USERNAME` i `ADMIN_PASSWORD`

### Monitorowanie
- **Logi**: Railway Dashboard → Logs
- **Metryki**: Railway Dashboard → Metrics
- **Baza danych**: Railway Dashboard → PostgreSQL service

## 🔒 Bezpieczeństwo

### Wymagane zmienne środowiskowe:
- `SESSION_SECRET` - minimum 32 znaki
- `ADMIN_PASSWORD` - silne hasło dla admina
- `DATABASE_URL` - automatycznie ustawiane przez Railway

### Opcjonalne zmienne:
```bash
# Email notifications
SMTP_HOST=your-smtp-host
SMTP_PORT=587
SMTP_USER=your-email@domain.com
SMTP_PASS=your-email-password

# PayPal payments
PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
PAYPAL_ENVIRONMENT=sandbox

# Stripe payments
STRIPE_SECRET_KEY=sk_live_your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=pk_live_your_stripe_publishable_key

# OpenAI integration
OPENAI_API_KEY=your-openai-api-key
```

## 🗄️ Baza danych

### Struktura tabel:
- `users` - użytkownicy systemu
- `chat_sessions` - sesje chatu
- `messages` - wiadomości w chatach
- `attachments` - załączniki do wiadomości
- `subscriptions` - subskrypcje użytkowników

### Backup:
Railway automatycznie tworzy backup PostgreSQL. Dla ręcznego backup:
```bash
railway connect postgres
pg_dump > backup.sql
```

## 📁 Pliki

### Struktura aplikacji na Railway:
```
/app/
├── dist/           # Zbudowana aplikacja
├── uploads/        # Przesłane pliki (automatycznie tworzone)
├── migrations/     # Migracje bazy danych
├── package.json
├── railway.toml    # Konfiguracja Railway
└── ...
```

### Automatyczne czyszczenie:
- Pliki w `uploads/` są automatycznie usuwane po 30 dniach
- Czyszczenie uruchamiane co 24 godziny

## 🌐 Domena

### Domena Railway:
Aplikacja będzie dostępna pod: `https://twoja-nazwa-projektu.railway.app`

### Własna domena:
1. W Railway Dashboard → Settings → Domains
2. Kliknij "Add Domain"
3. Wprowadź swoją domenę
4. Skonfiguruj DNS zgodnie z instrukcjami

## 🚨 Troubleshooting

### Problem z bazą danych:
```bash
# Sprawdź połączenie
railway run npm run health/db

# Uruchom migracje ponownie
railway run npm run db:migrate

# Sprawdź logi bazy danych
railway logs --service postgres
```

### Problem z sesją:
- Sprawdź czy `SESSION_SECRET` jest ustawione
- W produkcji długość minimum 32 znaki

### Problem z plikami:
- Katalog `/app/uploads` jest automatycznie tworzony
- Sprawdź logi dla błędów uprawnień

### Logi aplikacji:
```bash
railway logs
```

## 📈 Skalowanie

Railway automatycznie skaluje aplikację. Możesz:
- Zwiększyć limity w Settings → Resources
- Dodać replicas jeśli potrzebne
- Monitorować usage w Metrics

---

Po deployment aplikacja będzie działać identycznie jak na localhost, ale z PostgreSQL zamiast lokalnej bazy danych.