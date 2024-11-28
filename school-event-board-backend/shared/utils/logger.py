import logging

def get_logger(name):
    '''Centralized logger setup.'''
    logger = logging.getLogger(name)
    # Configure logging here
    return logger
