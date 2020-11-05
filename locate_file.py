import os

def locate_file(name, path):
    result = []
    for root, dirs, files in os.walk(path):
        f = files
    for ii in f:
        if name in ii:
            result.append(os.path.join(path,ii))
    return result