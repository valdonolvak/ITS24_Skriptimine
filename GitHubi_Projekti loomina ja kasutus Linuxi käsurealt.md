
---

## 🧰 1. Paigalda ja seadista GitHub CLI (`gh`)

Kui sul pole veel `gh` tööriista:
```bash
sudo apt update
sudo apt install gh
```

Logi sisse GitHubi:
```bash
gh auth login
```
Vali `GitHub.com`, autentimine brauseri kaudu ja kinnita kasutaja `valdonolvak`.

🎥 [How to ADD a NEW PROJECT to GitHub](https://www.youtube.com/watch?v=kcoJ9waG688) näitab selgelt, kuidas CLI abil GitHubi repo luua ja siduda see lokaalse projektiga.

---

## 🏗️ 2. Loo uus GitHubi repo nimega `HKHK_Skriptimine`

```bash
gh repo create HKHK_Skriptimine --public --confirm
```
Soovi korral lisa `--private`, kui soovid, et repo ei oleks avalik.

---

## 📁 3. Mine oma projekti kataloogi

```bash
cd /mnt/c/GitHub_ITS24
```

🎥 [Deploy a website in a linux (ubuntu) server from github.](https://www.youtube.com/watch?v=aq6zoi1DPVg) näitab, kuidas GitHubi repo siduda Linuxi serveriga ja faile hallata käsurealt – sobib hästi, kui soovid hiljem ka veebilehe või skriptide automaatset käivitamist.

---

## 🔧 4. Initsialiseeri Git ja lisa failid

```bash
git init
git add .
git commit -m "Algne versioon HKHK_Skriptimine projektist"
```

---

## 🔗 5. Määra kaugrepo GitHubis

SSH variandina:
```bash
git remote add origin git@github.com:valdonolvak/HKHK_Skriptimine.git
```

HTTPS variandina:
```bash
git remote add origin https://github.com/valdonolvak/HKHK_Skriptimine.git
```

---

## 🌿 6. Määra haru nimeks `main`

```bash
git branch -M main
```

---

## 🚀 7. Laadi projekt GitHubi

```bash
git push -u origin main
```

Kui SSH autentimine töötab (nagu sul juba kinnitatud), peaksid nägema, kuidas failid laetakse GitHubi.

---

## ✅ Kontrolli tulemust

Mine [valdonolvak/HKHK_Skriptimine GitHubis](https://github.com/valdonolvak/HKHK_Skriptimine) ja veendu, et failid on olemas.

---

Kui soovid, võin koostada bash-skripti, mis:
- küsib repo nime
- loob GitHubi repo CLI kaudu
- initsialiseerib lokaalse projekti
- ühendab GitHubiga
- teeb commit’i ja push’i

Kas soovid, et see skript oleks interaktiivne või sobiks CI/CD töövoogu kogukonnaprojektide haldamiseks?
