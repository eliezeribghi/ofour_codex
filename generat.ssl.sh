#!/bin/bash

# === CONFIGURATION ===
DOMAINE="ofour.link"
DOSSIER_CERT="ssl/live/$DOMAINE"

# === CRÉATION DES DOSSIERS ===
mkdir -p "$DOSSIER_CERT"

# === GÉNÉRATION DU CERTIFICAT AUTO-SIGNÉ ===
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout "$DOSSIER_CERT/privkey.pem" \
  -out "$DOSSIER_CERT/fullchain.pem" \
  -subj "/CN=$DOMAINE"

# === RÉCAPITULATIF ===
echo "Certificat généré dans : $DOSSIER_CERT"
echo "À monter dans Docker avec :"
echo "  - ./ssl:/etc/nginx/ssl"
echo "À utiliser dans Nginx :"
echo "  ssl_certificate     /etc/nginx/ssl/live/$DOMAINE/fullchain.pem;"
echo "  ssl_certificate_key /etc/nginx/ssl/live/$DOMAINE/privkey.pem;"
