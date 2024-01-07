#!/usr/bin/python3
""" This module used to make a backup of website's files """
from fabric.operations import local
import os
from datetime import datetime


def do_pack():
    """ Generates a .tgz archive from the contents of the web_static folder """
    if not os.path.isdir("versions"):
        local("mkdir versions")
    now = datetime.now()
    now_formated = now.strftime("%Y%m%d%H%M%S")
    path = "versions/web_static_{}.tgz".format(now_formated)
    archive = local("tar -cvzf {} web_static".format(path))
    if archive.failed:
        return None
    return path
