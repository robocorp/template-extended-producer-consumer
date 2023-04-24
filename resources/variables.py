import os

from datetime import datetime
from pathlib import Path


TODAY = datetime.strftime(datetime.now(), "%Y-%m-%d")
FILE_PATH = str(Path("devdata") / "file.txt")

# Environment variable which instructs the Consumer to create additional output for the
#  report computed at Step 3.
CREATE_REPORT = bool(os.getenv("CREATE_REPORT"))
