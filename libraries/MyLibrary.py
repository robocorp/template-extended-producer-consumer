"""RF-importable library written in Python."""

from robot.api import logger

# Variables can be accessed from the resources/variables.py Python module.
from variables import TODAY


class MyLibrary:
    """Give this library a proper name and document it."""

    def __init__(self):
        """Add and document optional input data passed during the import."""
        # Additionally add a state available for the entire life of the library.
        self._context = object()  # just an example (you can remove this)

    def log_today_in_python(self) -> None:
        """Displays today's date in Python."""
        logger.info(f"Today is {TODAY}. (from Python)")

    def my_library_keyword(self, var: str = "test") -> str:
        """Describe what this RF exposed keyword does."""
        logger.info("Python code (as RF keyword) executed with value: %s", var)
        return var
