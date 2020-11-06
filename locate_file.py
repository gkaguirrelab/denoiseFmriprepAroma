import os

def locate_file(name, path):
    result = []
    for root, dirs, files in os.walk(path):
        for file in files:
            if name in file:
                result.append(os.path.join(root, file))
            
    return result