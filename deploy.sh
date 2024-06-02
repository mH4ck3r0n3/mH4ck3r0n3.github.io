#!/bin/bash

# Se si verifica un errore, esci immediatamente
set -e

# Genera il sito statico
hugo

# Vai nella cartella di output generata da Hugo
cd public

# Aggiungi tutti i file nuovi e modificati a Git
git add .

# Committa i file
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Pusha il contenuto della cartella "public" sul branch "main" del repository
git push origin main

# Torna alla cartella precedente
cd ..
