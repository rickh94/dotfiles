#!/usr/bin/env python3
from lp_backup import Runner

run = Runner("/home/rick/.config/lp_backup.yml")
backup_file_name = run.backup()
