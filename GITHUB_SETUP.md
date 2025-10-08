# 🚀 Instrukcje tworzenia repozytorium GitHub "mechanik"

## Opcja A: Przez GitHub Web Interface (Zalecane)

### 1. Utwórz repo na GitHub.com
1. Idź na https://github.com
2. Kliknij zielony przycisk **"New"** lub **"+"** → **"New repository"**
3. Wypełnij formularz:
   - **Repository name**: `mechanik`
   - **Description**: `🔧 Profesjonalna aplikacja do komunikacji z mechanikami - Chat w czasie rzeczywistym, płatności, React + Express + PostgreSQL`
   - **Visibility**: Wybierz **Public** (zalecane) lub **Private**
   - **NIE** zaznaczaj "Add a README file" (mamy już gotowy)
   - **NIE** zaznaczaj "Add .gitignore" (mamy już gotowy)
   - **NIE** wybieraj licencji (mamy już MIT)
4. Kliknij **"Create repository"**

### 2. Połącz lokalne repo z GitHub
Po utworzeniu repo GitHub pokaże Ci instrukcje. Skopiuj i wykonaj te komendy:

```bash
# Dodaj remote origin (zmień 'twój-username' na swój GitHub username)
git remote add origin https://github.com/twój-username/mechanik.git

# Ustaw main jako default branch
git branch -M main

# Wypchnij kod na GitHub
git push -u origin main
```

## Opcja B: Przez GitHub CLI (Jeśli masz zainstalowane)

```bash
# Utwórz repo i wypchnij w jednej komendzie
gh repo create mechanik --public --description "🔧 Profesjonalna aplikacja do komunikacji z mechanikami - Chat w czasie rzeczywistym, płatności, React + Express + PostgreSQL" --push
```

## 📋 Sprawdzenie po utworzeniu

Po pushowaniu sprawdź czy wszystko się uploadowało:

1. **README.md** - powinien się wyświetlić jako główna strona repo
2. **Struktura plików** - sprawdź czy wszystkie foldery się uploadowały
3. **Migracje** - folder `migrations/` powinien zawierać SQL pliki
4. **Konfiguracja** - pliki `.env.example`, `railway.toml` itp.

## 🔗 Po utworzeniu repo

### 1. Skonfiguruj GitHub Pages (opcjonalne)
- Settings → Pages → Deploy from branch: `main` → `/docs` lub `/`

### 2. Dodaj topics/tags
- Na głównej stronie repo kliknij ⚙️ obok "About"
- Dodaj topics: `react`, `express`, `postgresql`, `typescript`, `railway`, `chat-app`, `mechanic`, `real-time`

### 3. Aktualizuj README
Jeśli chcesz dodać link do live demo, edytuj README.md i zmień:
```markdown
**Live Demo**: [https://mechanik.railway.app](https://mechanik.railway.app)
```
na rzeczywisty URL po deployment na Railway.

## 🚄 Następny krok: Railway Deployment

Po pushowaniu na GitHub możesz od razu deployować na Railway:

1. Idź na https://railway.app
2. "New Project" → "Deploy from GitHub repo"
3. Wybierz repo `mechanik`
4. Dodaj PostgreSQL service
5. Ustaw zmienne środowiskowe
6. Auto-deploy się uruchomi!

---

**Gotowe!** Repo będzie dostępne pod adresem: `https://github.com/twój-username/mechanik`