# This makes a container for the gear. Replace the first path next to the second COPY function 
# below with a path to your local compiled matlab function

FROM neurodebian:xenial
MAINTAINER Ozzy(ozenctaskin@hotmail.com)

#Copy everything into a container
ENV FLYWHEEL /flywheel/v0/
RUN mkdir -p ${FLYWHEEL}
COPY manifest.json run ${FLYWHEEL}
COPY locate_file.py ${FLYWHEEL}/locate_file.py
COPY fslinstaller.py /fslinstaller.py
RUN chmod +x /flywheel/v0/*

# Install required packages     
RUN apt-get update \
    && apt-get install -y \
    software-properties-common
RUN apt-get update
RUN apt-get install -y \
    wget \
    zip \
    unzip\
    fsl

# Set the entrypoint  
ENTRYPOINT /flywheel/v0/run
