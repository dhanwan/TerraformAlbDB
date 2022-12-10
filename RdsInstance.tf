# module "db" {
#   source  = "terraform-aws-modules/rds/aws"
#   version = "5.2.0"
#   # insert the 1 required variable here
#     identifier = var.db_instance_identifier

#   # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
#   engine               = "mysql"
#   engine_version       = "8.0.27"
#   family               = "mysql8.0" # DB parameter group
#   major_engine_version = "8.0"      # DB option group
#   instance_class       = "db.t2.micro"

#   allocated_storage     = 20
#   max_allocated_storage = 100

#   db_name  = "completeMysql"
#   username = "complete_mysql"
#   port     = 3306

#   multi_az               = false
#   subnet_ids             = data.terraform_remote_state.vpc.outputs.db_subnets
#   vpc_security_group_ids = [module.rds_sg.security_group_id]

#   maintenance_window              = "Mon:00:00-Mon:03:00"
#   backup_window                   = "03:00-06:00"
#   enabled_cloudwatch_logs_exports = ["general"]
#   create_cloudwatch_log_group     = true

#   backup_retention_period = 0
#   skip_final_snapshot     = true
#   deletion_protection     = false

#   performance_insights_enabled          = true
#   performance_insights_retention_period = 7
#   create_monitoring_role                = true
#   monitoring_interval                   = 60

#   parameters = [
#     {
#       name  = "character_set_client"
#       value = "utf8mb4"
#     },
#     {
#       name  = "character_set_server"
#       value = "utf8mb4"
#     }
#   ]

#   tags = local.common_tags
# }