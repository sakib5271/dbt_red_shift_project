#!d:\dbt_project\dbt_env\scripts\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'daff==1.3.46','console_scripts','daff'
__requires__ = 'daff==1.3.46'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('daff==1.3.46', 'console_scripts', 'daff')()
    )
