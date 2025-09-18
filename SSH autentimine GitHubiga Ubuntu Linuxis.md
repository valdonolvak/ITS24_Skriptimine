**täpne juhend nii SSH autentimise seadistamiseks** kui ka **GitHubi Personal Access Tokeni (PAT) loomise ja kasutamise kohta**. Mõlemad meetodid sobivad GitHubi ühendamiseks, kuid SSH on eelistatud, kui soovid paroolivaba ja turvalist ühendust.

---

## 🔐 1. **SSH autentimine GitHubiga Ubuntu Linuxis**

### 🧱 Sammud:

1. **Kontrolli, kas SSH võti on juba olemas:**
   ```bash
   ls -al ~/.ssh
   ```

2. **Loo uus SSH võti (soovitatavalt ed25519):**
   ```bash
   ssh-keygen -t ed25519 -C "valdo@example.com"
   ```
   Vajuta Enter, kui küsitakse faili asukohta. Soovi korral lisa parool.

3. **Lisa võti SSH agenti:**
   ```bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   ```

4. **Lisa võti GitHubi:**
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   Kopeeri väljund ja lisa see GitHubis:  
   *Settings → SSH and GPG keys → New SSH key*

5. **Testi ühendust:**
   ```bash
   ssh -T git@github.com
   ```
   Kui näed:  
   `Hi valdonolvak! You've successfully authenticated...`  
   siis kõik töötab!

🎥 [Easy SSH Key Setup for GitHub on Ubuntu - Let's Get Secure!](https://www.youtube.com/watch?v=Zzqtj0sRB1k) näitab kogu protsessi alates võtme loomisest kuni GitHubi ühendamiseni.

🎥 [Git - Setup Login to GitHub with SSH Key on Linux or Mac](https://www.youtube.com/watch?v=wPQSR8K89z4) selgitab, kuidas seadistada SSH autentimist GitHubi jaoks Linuxis ja Macis.

🎥 [Create & Add SSH Keys To GitHub For Authentication](https://www.youtube.com/watch?v=yVP3sYgd0bY) õpetab, kuidas luua ja lisada SSH võtmeid GitHubi kontole.

🎥 [Configure GitHub SSH Keys](https://www.youtube.com/watch?v=s6KTbytdNgs) näitab, kuidas seadistada SSH agent ja `~/.ssh/config` fail, et ühendus toimiks automaatselt.

🎥 [Linux SSH Keys | SSH keys for GitHub | Connecting to GitHub ...](https://www.youtube.com/watch?v=vXzTl10G71w) annab põhjaliku ülevaate SSH võtmete loomisest, lisamisest ja testimisest GitHubiga.

---

## 🔑 2. **Personal Access Token (PAT) loomine ja kasutamine**

Kui soovid kasutada HTTPS-ühendust (nt skriptides või CI/CD töövoogudes), siis GitHub ei luba enam parooliga autentimist — selle asemel kasutatakse **PAT-i**.

### 🧱 Sammud:

1. **Mine GitHubi → Settings → Developer settings → Personal access tokens**
2. **Kliki “Generate new token”**
3. **Vali õigused:**
   - `repo` (koodi lugemiseks ja kirjutamiseks)
   - `workflow` (CI/CD jaoks)
   - `admin:repo_hook` (webhookide haldus)

4. **Kopeeri token ja salvesta turvaliselt!**  
   GitHub ei näita seda hiljem uuesti.

5. **Kasutamine Git käsureal:**
   Kui push’id HTTPS kaudu:
   ```bash
   git remote set-url origin https://github.com/valdonolvak/HKHK_Skriptimine.git
   git push
   ```
   Kui küsitakse kasutajanime: `valdonolvak`  
   Kui küsitakse parooli: **kleebi token**

🎥 [Using Personal Access Tokens with GIT and GitHub](https://www.youtube.com/watch?v=kHkQnuYzwoo) selgitab, kuidas PAT luua, kasutada ja hallata GitHubi ühenduses.

---

## 🧠 Millal kasutada SSH vs PAT?

| Meetod | Kasutus | Eelised |
|--------|---------|---------|
| **SSH** | Käsurea töövood, push/pull | Paroolivaba, turvaline, sobib hästi arenduseks |
| **PAT** | HTTPS ühendus, CI/CD, skriptid | Lihtne integreerida, sobib automatiseerimiseks |

---

Kui soovid, võin aidata koostada skripti, mis:
- loob SSH võtme
- lisab selle agenti
- testib ühendust
- või kasutab PAT-i automaatselt push’i jaoks

Kas soovid, et see skript oleks interaktiivne või sobiks CI/CD töövoogu kogukonnaprojektide haldamiseks?
