#!/bin/bash

fail=$1
LOGIFAIL="/mnt/c/GitHub-ITS24/systeemilogi.log"

#Funktsioon, mis muudab tähed väikeseks ja asendab täpitähed
asenda_tahed(){
        echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/õ/o/g' -e 's/ä/a/g' -e 's/ö/o/g' -e 's/ü/y/g'
}

#Loeme fiali rida realt
while read enimi pnimi grupp; do
        #Töötleme ees- ja perenimed ära
        eesnimi=$(asenda_tahed "$enimi")
        perenimi=$(asenda_tahed "$pnimi")

        #Loome kasutajanime ees- ja perekonnanimest
        kasutajanimi="${eesnimi}.${perenimi}"

        #Kontrollin, kas on olemas grupp, kuhu ma kasutajat tahan lisada
        cat /etc/group | grep $grupp >> /dev/null
        if [ $? -ne 0 ]; then
                groupadd $grupp
        fi

        #Kontrollin, et ega süsteemis ei ole loodavat kasutajat olemas
        cat /etc/passwd | grep $kasutajanimi >> /dev/null
        if [ $? -ne 0 ]; then
                useradd -g $grupp -d /home/$kasutajanimi -m -s /bin/bash -c "$enimi $pnimi" $kasutajanimi
                echo "$(date '+%d.%m.%Y %H:%M:%S') - Süsteemi lisati uus kasutaja nimega $kasutajanimi" >> $LOGIFAIL
        else
                echo "Süsteemis on juba olemas kasutaja nimega $kasutajanimi"
        fi

done < "$fail"
