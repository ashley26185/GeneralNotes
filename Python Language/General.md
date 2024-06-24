#  Returns list of all functions in the moduleName
import moduleName
print(dir(moduleName))

# Logging
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)