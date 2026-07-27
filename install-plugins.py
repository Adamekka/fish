#!/usr/bin/env python3

import subprocess

plugins_file = open("fish_plugins", "r")
plugins = plugins_file.readlines()
plugins_file.close()

plugins = [plugin.strip() for plugin in plugins]

for plugin in plugins:
    print("Installing: " + plugin)
    subprocess.run(["fish", "-c", "fisher install " + plugin])
