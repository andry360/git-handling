#!/usr/bin/env bash

header_info() {
clear
cat <<"EOF"
git handling commands!
EOF
}

# Funzione per mostrare il menu principale
show_menu() {
    clear
    echo "🔹 1) 📁 Inizializzazione e Clonazione      - Crea o clona una repository Git"
    echo "🔹 2) 📄 Stato e Storico                    - Controlla lo stato e visualizza i commit"
    echo "🔹 3) 📌 Gestione dei Branch                - Crea, cambia e unisci branch"
    echo "🔹 4) 🔄 Operazioni sui Commit              - Aggiungi, committa e resetta modifiche"
    echo "🔹 5) 📡 Sincronizzazione con il Remoto     - Push, pull e gestione del repository remoto"
    echo "🔹 6) 🎯 Tagging e Versionamento            - Crea e visualizza tag per versioning"
    echo "🔹 7) ❌ Annulla Modifiche                  - Ripristina file o annulla commit"
    echo "🔹 8) ✅ Risolvi conflitti                  - Serie di comandi utili in caso di conflitti"
    echo "🔹 9) 🚪 Esci                               - Chiude il programma"
    echo ""
}

# Funzione per il menu della sezione scelta
show_section() {
    clear
    case $1 in
        1)  # Inizializzazione e Clonazione
            echo "📁 INIZIALIZZAZIONE E CLONAZIONE"
            echo "1) Inizializza una repository (git init)"
            echo "2) Clona un repository (git clone URL)"
            echo "3) Torna al menu principale"
            ;;
        2)  # Stato e Storico
            echo "📄 STATO E STORICO"
            echo "1) Controlla lo stato (git status)"
            echo "2) Mostra log compatto (git log --oneline --graph)"
            echo "3) Mostra log dettagliato (git log --stat)"
            echo "4) Torna al menu principale"
            ;;
        3)  # Gestione dei Branch
            echo "📌 GESTIONE DEI BRANCH"
            echo "1) Visualizza i branch (git branch)"
            echo "2) Crea un nuovo branch (git checkout -b nome-branch)"
            echo "3) Passa a un branch esistente (git checkout nome-branch)"
            echo "4) Unisci un branch (git merge nome-branch)"
            echo "5) Rebase su un branch (git rebase nome-branch)"
            echo "6) Torna al menu principale"
            ;;
        4)  # Operazioni sui Commit
            echo "🔄 OPERAZIONI SUI COMMIT"
            echo "1) Aggiungi file (git add .)"
            echo "2) Crea un commit (git commit -m 'messaggio')"
            echo "3) Resetta l'ultimo commit mantenendo le modifiche (git reset --soft HEAD~1)"
            echo "4) Resetta l'ultimo commit eliminando le modifiche (git reset --hard HEAD~1)"
            echo "5) Torna al menu principale"
            ;;
        5)  # Sincronizzazione con il Remoto
            echo "📡 SINCRONIZZAZIONE CON IL REMOTO"
            echo "1) Invia al remoto (git push origin nome-branch)"
            echo "2) Recupera aggiornamenti (git pull origin nome-branch)"
            echo "3) Visualizza i remote (git remote -v)"
            echo "4) Cambia il remote origin (git remote set-url origin URL)"
            echo "5) Torna al menu principale"
            ;;
        6)  # Tagging e Versionamento
            echo "🎯 TAGGING E VERSIONAMENTO"
            echo "1) Crea un tag (git tag -a nome-tag -m 'messaggio')"
            echo "2) Visualizza i tag (git tag)"
            echo "3) Torna al menu principale"
            ;;
        7)  # Annulla Modifiche
            echo "❌ ANNULLA MODIFICHE"
            echo "1) Annulla modifiche non committate (git checkout -- file)"
            echo "2) Torna al menu principale"
            ;;
        8)  # Risoluzione conflitti
            echo "1) mostra quali file sono in conflitto. (git status)"
            echo "2) Tieni solo la versione corretta e salva. (git add nomefile)"
            echo "3) Completa il merge o rebase (git commit -m "Risolto conflitto su nomefile")"
            echo "4) Accettare sempre la tua versione"
            echo "1) Accettare sempre la versione remota"
        9)  # Esci
            echo "👋 Uscita dal Git Helper..."
            exit 0
            ;;
    esac
    echo ""
}

# Funzione per eseguire i comandi Git in base alla scelta
execute_command() {
    case $1 in
        # Inizializzazione e Clonazione
        11) git init ;;
        12) read -p "Inserisci l'URL del repository: " repo_url; git clone "$repo_url" ;;

        # Stato e Storico
        21) git status ;;
        22) git log --oneline --graph ;;
        23) git log --stat ;;

        # Gestione dei Branch
        31) git branch ;;
        32) read -p "Nome del nuovo branch: " new_branch; git checkout -b "$new_branch" ;;
        33) read -p "Nome del branch: " branch; git checkout "$branch" ;;
        34) read -p "Nome del branch da unire: " merge_branch; git merge "$merge_branch" ;;
        35) read -p "Branch su cui fare rebase: " rebase_branch; git rebase "$rebase_branch" ;;

        # Operazioni sui Commit
        41) git add . ;;
        42) read -p "Messaggio del commit: " msg; git commit -m "$msg" ;;
        43) git reset --soft HEAD~1 ;;
        44) git reset --hard HEAD~1 ;;

        # Sincronizzazione con il Remoto
        51) read -p "Branch da pushare: " push_branch; git push origin "$push_branch" ;;
        52) read -p "Branch da aggiornare: " pull_branch; git pull origin "$pull_branch" ;;
        53) git remote -v ;;
        54) read -p "Nuovo URL per origin: " new_url; git remote set-url origin "$new_url" ;;

        # Tagging e Versionamento
        61) read -p "Nome del tag: " tag; read -p "Messaggio del tag: " tag_msg; git tag -a "$tag" -m "$tag_msg" ;;
        62) git tag ;;

        # Annulla Modifiche
        71) read -p "Nome del file da ripristinare: " file; git checkout -- "$file" ;;

        # Risoluzione conflitti
        81) git status ;;
        82) git add nomefile ;;
        83) git commit -m "Risolto conflitto su nomefile" ;;
        84) git checkout --ours .; git add .; git commit -m "Risolto conflitto (tenuta la mia versione)"
        85) git checkout --theirs .; git add .; git commit -m "Risolto conflitto (tenuta la versione remota)"

    esac
}
echo "eh!
# Loop principale
header_info
while true; do
    show_menu
    read -p "🔹 Scegli una categoria: " category
    show_section $category

    if [ "$category" -lt 8 ]; then
        read -p "🛠️ Scegli un comando: " command
        execute_command "$category$command"
    fi

    read -p "🔄 Premi Invio per continuare..."
done
