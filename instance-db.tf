resource "scaleway_rdb_instance" "main" {
  name          = "mysql-rdb"
  node_type     = "DB-DEV-S"
  engine        = "MySQL-8"
  is_ha_cluster = true
  user_name     = "phpipam"
  password      = "Azerty!123"

  disable_backup = true
  backup_schedule_frequency = 24 # every day
  backup_schedule_retention = 7  # keep it one week
}

resource "scaleway_rdb_database" "main" {
  instance_id    = scaleway_rdb_instance.main.id
  name           = "db-phpipam"
}
