# ITS24_Skriptimine

sudo apt install gh
gh auth login
gh repo create ITS24_Skriptimine --public --confirm


Et veenduda, et haru on tõesti `main`, võid käivitada:

```bash
git branch
```

See näitab aktiivset haru, näiteks:
```
* main
```

Kui see on olemas, oled valmis push’ima GitHubi. Siin on veel kord kogu käik, et projekt kindlalt üles laadida:

---

## 🚀 GitHubi laadimise lõppjuhis

```bash
git add .
git commit -m "Laadin ITS24 projekti GitHubi"
git remote set-url origin git@github.com:valdonolvak/ITS24_Skriptimine.git
git push -u origin main
```

Kui kõik on õigesti seadistatud (SSH töötab, repo eksisteerib, haru on `main`), peaksid nägema, kuidas failid laetakse GitHubi.

---

Kui soovid, võin sulle koostada skripti, mis:
- kontrollib, kas `.git` on olemas
- määrab haru `main`
- lisab failid ja commit’i
- ühendab GitHubiga
- push’ib automaatselt

Kas soovid, et see skript oleks interaktiivne või sobiks CI/CD töövoogu ITS24 projekti haldamiseks?

