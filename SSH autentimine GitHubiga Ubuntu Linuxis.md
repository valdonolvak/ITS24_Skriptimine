 SSH autentimine GitHubiga Ubuntu Linuxis
🧱 Sammud:
- Kontrolli, kas SSH võti on juba olemas:
ls -al ~/.ssh
- Loo uus SSH võti (soovitatavalt ed25519):
ssh-keygen -t ed25519 -C "valdo@example.com"
- Vajuta Enter, kui küsitakse faili asukohta. Soovi korral lisa parool.
- Lisa võti SSH agenti:
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
- Lisa võti GitHubi:
cat ~/.ssh/id_ed25519.pub
- Kopeeri väljund ja lisa see GitHubis:
Settings → SSH and GPG keys → New SSH key
- Testi ühendust:
ssh -T git@github.com


- Kui näed:
Hi valdonolvak! You've successfully authenticated...
siis kõik töötab!
🎥 Easy SSH Key Setup for GitHub on Ubuntu - Let's Get Secure! näitab kogu protsessi alates võtme loomisest kuni GitHubi ühendamiseni.🎥 Git - Setup Login to GitHub with SSH Key on Linux or Mac selgitab, kuidas seadistada SSH autentimist GitHubi jaoks Linuxis ja Macis.🎥 Create & Add SSH Keys To GitHub For Authentication õpetab, kuidas luua ja lisada SSH võtmeid GitHubi kontole.🎥 Configure GitHub SSH Keys näitab, kuidas seadistada SSH agent ja ~/.ssh/config fail, et ühendus toimiks automaatselt.🎥 Linux SSH Keys | SSH keys for GitHub | Connecting to GitHub ... annab põhjaliku ülevaate SSH võtmete loomisest, lisamisest ja testimisest GitHubiga.🔑 2. Personal Access Token (PAT) loomine ja kasutamineKui soovid kasutada HTTPS-ühendust (nt skriptides või CI/CD töövoogudes), siis GitHub ei luba enam parooliga autentimist — selle asemel kasutatakse PAT-i.🧱 Sammud:- Mine GitHubi → Settings → Developer settings → Personal access tokens
- Kliki “Generate new token”
- Vali õigused:
- repo (koodi lugemiseks ja kirjutamiseks)
- workflow (CI/CD jaoks)
- admin:repo_hook (webhookide haldus)
- Kopeeri token ja salvesta turvaliselt!
GitHub ei näita seda hiljem uuesti.
- Kasutamine Git käsureal: Kui push’id HTTPS kaudu:
git remote set-url origin https://github.com/valdonolvak/HKHK_Skriptimine.git
git push
- Kui küsitakse kasutajanime: valdonolvak
Kui küsitakse parooli: kleebi token
🎥 Using Personal Access Tokens with GIT and GitHub selgitab, kuidas PAT luua, kasutada ja hallata GitHubi ühenduses.🧠 Millal kasutada SSH vs PAT?|  |  |  | 
|  |  |  | 
|  |  |  | 

Kui soovid, võin aidata koostada skripti, mis:- loob SSH võtme
- lisab selle agenti
- testib ühendust
- või kasutab PAT-i automaatselt push’i jaoks
Kas soovid, et see skript oleks interaktiivne või sobiks CI/CD töövoogu kogukonnaprojektide haldamiseks?
