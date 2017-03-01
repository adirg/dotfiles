import errno
import logging
import os

def _configure_logging():
    logging.basicConfig(level=logging.INFO)

def _create_dir(path):
    logging.info("Creating path: %(path)s", dict(path=path))
    try:
        os.makedirs(path)
    except OSError as exc: 
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            logging.warn("Path %(path)s already exists", dict(path=path))
        else:
            logging.exception("Failed to create path: %(path)s", dict(path=path))
            raise

def _create_link(lnk, src):
    logging.info("Creating link: %(lnk)s ---> %(src)s", dict(lnk=lnk, src=src))
    try:
        os.symlink(src, lnk)
    except OSError as exc: 
        if exc.errno == errno.EEXIST:
            logging.warn("File %(file)s already exists", dict(file=lnk))
        else:
            raise

def install():
    _configure_logging()
    dotfiles_dir = "dotfiles"
    home_dir = os.environ["HOME"]
    for dirpath, dirnames, filenames in os.walk(dotfiles_dir):
        for f in filenames:
            if os.path.relpath(dirpath, dotfiles_dir) != '.':
                path = os.path.join(home_dir, os.path.relpath(dirpath, dotfiles_dir))
                _create_dir(path)
            lnk = os.path.join(home_dir, os.path.relpath(os.path.join(dirpath, f), dotfiles_dir))
            src = os.path.abspath(os.path.join(dirpath, f))
            _create_link(lnk, src)
    

if __name__ == "__main__":
    install()
