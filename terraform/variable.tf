

variable "import_sql_password" {
  description = "Mot de passe pour sécuriser l'import SQL"
  type        = string
  sensitive   = true
}
variable "name_project" {
  type = string
  description = "Nom du projet Google Cloud"
}

variable "id_project" {
  type = string
  description = "ID du projet Google Cloud"
}

variable "service_account_email" {
  type = string
  description = "Adresse e-mail du compte de service"
}

variable "db_password" {
  type = string
  description = "Mot de passe pour la base de données"
  sensitive   = true # Important pour la sécurité
}
