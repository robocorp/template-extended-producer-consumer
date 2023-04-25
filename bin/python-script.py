#! /usr/bin/env python

"""Script that gets run by rcc right before the robot starts.
(consult robot.yaml for more details)
"""


import sys
import time
from pathlib import Path


def main(argv, argc):
    # Use `argparse` for better support towards CLI argument parsing:
    #  https://docs.python.org/3/library/argparse.html
    if argc != 2:
        print(f"Usage: {argv[0]} PATH")
        return 1

    path = Path(argv[1])
    path.parent.mkdir(parents=True, exist_ok=True)
    current_time = time.ctime()
    path.write_text(f"This is just a text file. (generated at {current_time})\n")

    return 0


if __name__ == "__main__":
    return_code = main(sys.argv, len(sys.argv))
    sys.exit(int(return_code or 0))
