# Railway CLI Commands

## Instalacja Railway CLI
```bash
npm install -g @railway/cli
```

## Logowanie
```bash
railway login
```

## Inicjalizacja projektu
```bash
railway init
```

## Dodanie bazy danych PostgreSQL
```bash
railway add postgresql
```

## Deploy aplikacji
```bash
railway up
```

## Uruchomienie migracji
```bash
railway run npm run db:migrate
```

## Sprawdzenie logów
```bash
railway logs
```

## Dodanie zmiennych środowiskowych
```bash
railway vars set NODE_ENV=production
railway vars set SESSION_SECRET=twój-bezpieczny-klucz
railway vars set ADMIN_USERNAME=admin
railway vars set ADMIN_PASSWORD=twoje-hasło
```

## Podłączenie do bazy danych
```bash
railway connect postgres
```

## Status serwisów
```bash
railway status
```