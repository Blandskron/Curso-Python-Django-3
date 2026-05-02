############################################
# POSTGRES EN WINDOWS (LOCAL)
############################################

WIN_PG_HOST = "127.0.0.1"
WIN_PG_PORT = 5432
WIN_PG_DB = "fintech_DB"
WIN_PG_USER = "postgres"
WIN_PG_PASSWORD = "admin1234"

############################################
# POSTGRES EN DOCKER (DESDE WINDOWS)
############################################

DOCKER_PG_HOST = "127.0.0.1"
DOCKER_PG_PORT = 5433
DOCKER_PG_DB = "app_db"
DOCKER_PG_USER = "postgres"
DOCKER_PG_PASSWORD = "admin1234"

############################################
# POSTGRES WINDOWS (DESDE DOCKER)
############################################

WIN_PG_FROM_DOCKER_HOST = "host.docker.internal"
WIN_PG_FROM_DOCKER_PORT = 5432
WIN_PG_FROM_DOCKER_DB = "fintech_DB"
WIN_PG_FROM_DOCKER_USER = "postgres"
WIN_PG_FROM_DOCKER_PASSWORD = "admin1234"

############################################
# POSTGRES DOCKER (DESDE DOCKER)
############################################

DOCKER_PG_INTERNAL_HOST = "postgres"
DOCKER_PG_INTERNAL_PORT = 5432
DOCKER_PG_INTERNAL_DB = "app_db"
DOCKER_PG_INTERNAL_USER = "postgres"
DOCKER_PG_INTERNAL_PASSWORD = "admin1234"