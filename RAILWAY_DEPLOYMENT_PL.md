# Deployment na Railway

## Kroki wdrożenia:

### 1. Przygotowanie projektu
```bash
npm install
npm run db:generate
```

### 2. Utwórz konto na Railway
- Idź na https://railway.app
- Zaloguj się przez GitHub
- Utwórz nowy projekt

### 3. Dodaj bazę danych PostgreSQL
- W Railway dashboard, kliknij "New"
- Wybierz "Database" -> "PostgreSQL"
- Poczekaj aż baza zostanie utworzona

### 4. Wdróż aplikację
- Kliknij "New" -> "GitHub Repo"
- Wybierz swoje repozytorium
- Railway automatycznie wykryje że to Node.js projekt

### 5. Skonfiguruj zmienne środowiskowe
W ustawieniach deployment dodaj:

```bash
NODE_ENV=production
DATABASE_URL=${{Postgres.DATABASE_URL}}
SESSION_SECRET=twój-bezpieczny-klucz-sesji-minimum-32-znaki
ADMIN_USERNAME=admin
ADMIN_PASSWORD=twoje-bezpieczne-hasło-admina
UPLOAD_DIR=/app/uploads
```

### 6. Uruchom migracje
Po pierwszym deployment, w Railway console uruchom:
```bash
npm run db:migrate
```

### 7. Opcjonalne zmienne środowiskowe
Jeśli używasz dodatkowych serwisów, dodaj także:

```bash
# Email
SMTP_HOST=twój-smtp-host
SMTP_PORT=587
SMTP_USER=twój-email@domena.com
SMTP_PASS=hasło-email

# PayPal
PAYPAL_CLIENT_ID=twój-paypal-client-id
PAYPAL_CLIENT_SECRET=twój-paypal-client-secret
PAYPAL_ENVIRONMENT=sandbox

# Stripe
STRIPE_SECRET_KEY=sk_live_lub_test_klucz
STRIPE_PUBLISHABLE_KEY=pk_live_lub_test_klucz

# OpenAI
OPENAI_API_KEY=twój-openai-klucz
```

### 8. Konfiguracja domeny (opcjonalne)
- W ustawieniach deployment kliknij "Domains"
- Dodaj swoją domenę lub użyj domeny Railway
- Aplikacja będzie dostępna pod adresem: `https://twoja-nazwa-projektu.railway.app`

## Struktura plików na Railway:

```
/app/
├── dist/               # Skompilowana aplikacja
├── uploads/           # Przesłane pliki
├── migrations/        # Migracje bazy danych
├── package.json
└── ...
```

## Monitorowanie:

1. **Logi**: Sprawdzaj logi w Railway dashboard
2. **Health Check**: Aplikacja ma endpoint `/health` dla monitorowania
3. **Metryki**: Railway automatycznie monitoruje CPU, RAM i bandwidth

## Troubleshooting:

### Problem z połączeniem do bazy danych:
- Sprawdź czy `DATABASE_URL` jest poprawnie ustawione
- Upewnij się że serwis PostgreSQL jest uruchomiony

### Problem z sesją:
- Sprawdź czy `SESSION_SECRET` jest ustawione
- W produkcji rozważ użycie Redis do przechowywania sesji

### Problem z plikami:
- Upewnij się że katalog `/app/uploads` istnieje
- Sprawdź uprawnienia do zapisu

## Backup bazy danych:

Railway automatycznie tworzy backup PostgreSQL. Aby utworzyć ręczny backup:
```bash
railway connect postgres
pg_dump > backup.sql
```

## Skalowanie:

Railway automatycznie skaluje aplikację w zależności od ruchu. Możesz:
- Zwiększyć limity CPU/RAM w ustawieniach
- Dodać więcej replicas jeśli potrzebne
- Monitorować usage w dashboard