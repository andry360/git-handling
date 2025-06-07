#!/usr/bin/env bash

git config --global credential.helper 'cache --timeout=1800'

# Il comando per lanciare questo script da github è: bash -c "$(wget --no-cache -qLO - https://raw.githubusercontent.com/andry360/git-handling/refs/heads/main/git-commands.sh)"

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
  echo "🔹 9) 🛡️ Permessi e Push                    - Rendi tutto leggibile, scrivibile, eseguibile e fai push"
  echo "🔹 10) 🚪 Esci                              - Chiude il programma"

  echo ""
}

# Funzione per il menu della sezione scelta
show_section() {
  clear
  case $1 in
    1)  # Inizializzazione e Clonazione
      echo "📁 INIZIALIZZAZIONE E CLONAZIONE"
      echo "1) Inizializza una repository (git init)"
      echo "2) Clona un repository inserendo manualmente il link (git clone URL)"
      echo "3) Clona prxmx-config-v1-bridge (git clone https://gitlab.com/andry360/prxmx-config.git)"
      echo "4) Clona pxmx-config-v2-passtrough (git clone https://gitlab.com/andry360/pxmx-config-v2-passtrough.git)"
      echo "5) Torna al menu principale"
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
      echo "RISOLUZIONE CONFLITTI"
      echo "1) mostra quali file sono in conflitto. (git status)"
      echo "2) Tieni solo la versione corretta e salva. (git add nomefile)"
      echo "3) Completa il merge o rebase (git commit -m 'Risolto conflitto su nomefile')"
      echo "4) Accettare sempre la tua versione"
      echo "5) Accettare sempre la versione remota"
      ;;
    9)  # Permessi e Push
      echo "🛡️ PERMESSI E PUSH"
      echo "1) Dai permessi di lettura, scrittura ed esecuzione a tutti i file e cartelle (chmod -R a+rwx .)"
      echo "2) Torna al menu principale"
      ;;
    10)  # Esci
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
  12)
    echo "Scegli quale repository clonare:"
    echo "1) Inserisci manualmente il link"
    echo "2) prxmx-config (https://gitlab.com/andry360/prxmx-config.git)"
    echo "3) pxmx-config-v2-passtrough (https://gitlab.com/andry360/pxmx-config-v2-passtrough.git)"
    read -p "Scelta: " clone_choice
    case $clone_choice in
      1)
        read -p "Inserisci l'URL del repository: " repo_url
        git clone "$repo_url"
        ;;
      2)
        git clone https://gitlab.com/andry360/prxmx-config.git
        ;;
      3)
        git clone https://gitlab.com/andry360/pxmx-config-v2-passtrough.git
        ;;
      *)
        echo "Scelta non valida."
        ;;
    esac
    ;;

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
  82) conflicted_files=$(git diff --name-only --diff-filter=U)
      if [[ -z "$conflicted_files" ]]; then
        printf "⚠️  Nessun file in conflitto trovato.\n" >&2
      else
        printf "✅ Aggiunta automatica dei file risolti:\n%s\n" "$conflicted_files"
        git add $conflicted_files
      fi
      ;;
  83) conflicted_files=$(git diff --name-only --diff-filter=U)
      if [[ -z "$conflicted_files" ]]; then
        printf "⚠️  Nessun file in conflitto trovato.\n" >&2
      else
        printf "✅ Completamento del merge per i file risolti:\n%s\n" "$conflicted_files"
        git add $conflicted_files
        git commit -m "Risolto conflitto su: $conflicted_files"
      fi
      ;;
  84) conflicted_files=$(git diff --name-only --diff-filter=U)
      if [[ -z "$conflicted_files" ]]; then
        printf "⚠️  Nessun file in conflitto trovato.\n" >&2
      else
        printf "✅ Accettata la versione locale per i file:\n%s\n" "$conflicted_files"
        git checkout --ours $conflicted_files
        git add $conflicted_files
        git commit -m "Risolto conflitto (tenuta la mia versione): $conflicted_files"
      fi
      ;;
  85) 
      conflicted_files=$(git diff --name-only --diff-filter=U)
      if [[ -z "$conflicted_files" ]]; then
        echo "⚠️  Nessun file in conflitto trovato. Procedo con il pull accettando la versione remota."
        git config pull.rebase false # Configura il pull per fare un merge
        git pull --strategy-option=theirs
        if [[ $? -eq 0 ]]; then
          echo "✅ Repository sincronizzato. Ora puoi fare una push."
        else
          echo "❌ Errore durante il pull. Verifica manualmente i conflitti o la configurazione."
        fi
      else
        echo "✅ Accettata la versione remota per i file in conflitto:"
        echo "$conflicted_files"
        git checkout --theirs $conflicted_files
        git add $conflicted_files
        git commit -m "Risolto conflitto (tenuta la versione remota): $conflicted_files"
        echo "✅ Repository sincronizzato. Ora puoi fare una push."
      fi
      ;;
  # Permessi e Push
  91)
    chmod -R a+rwx .
    echo "✅ Permessi di lettura, scrittura ed esecuzione assegnati a tutti i file e cartelle."
    read -p "Vuoi eseguire una push ora? (s/n): " do_push
    if [[ "$do_push" =~ ^[sS]$ ]]; then
      git status
      git add .
      git commit -m "permessi aggiornati"
      git push origin main
    else
      echo "Push annullato."
    fi
    ;;

  esac
}
echo "eh!"
# Loop principale
header_info
while true; do
  show_menu
  read -p "🔹 Scegli una categoria: " category
  if [ "$category" -eq 10 ]; then
    echo "👋 Uscita dal Git Helper..."
    exit 0
  fi

  show_section $category
  read -p "🛠️ Scegli un comando: " command
  execute_command "$category$command"

  read -p "🔄 Premi Invio per continuare..."
done


: <<'COMMENTO'

chmod -R a+rx ~/documenti
git status # Verifica le modifiche
git add . # Aggiungi tutti i file modificati allo staging
git commit -m "Aggiunti permessi di lettura ed esecuzione ai file" # Committa le modifiche
git push origin main # Esegui il push delle modifiche sul branch main

COMMENTO