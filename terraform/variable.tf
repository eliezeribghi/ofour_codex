variable "db_password" {
  description = "Mot de passe de l'utilisateur root de la base de données"
  type        = string
  sensitive   = true
}

variable "import_sql_password" {
  description = "Mot de passe pour sécuriser l'import SQL"
  type        = string
  sensitive   = true
}

