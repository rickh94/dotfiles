#!/usr/bin/env python3
from lp_backup import Runner

run = Runner("/home/rick/.config/lp_backup.yml")
run.restore("2018-11-17T12:25:50.037298-fredericmhenry@gmail.com-lastpass-backup.csv.encrypted.xz", "/tmp/lp_restore.csv")
# print(f"New restore: {restore_file_name}")
