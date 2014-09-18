FROM ubuntu

MAINTAINER Austin G. Davis-Richardson <_@agdr.co>
DESCRIPTION https://registry.hub.docker.com/u/audy/docker-picrust/
HOMEPAGE

RUN apt-get update

RUN apt-get install -y python-pip python-dev wget

RUN pip install numpy==1.5.1
RUN pip install biom-format==1.3.1
RUN pip install cogent # docs request 1.5.3 but it doesnt work

RUN wget
https://github.com/picrust/picrust/releases/download/1.0.0/picrust-1.0.0.tar.gz

RUN tar -zxvf picrust-1.0.0.tar.gz

RUN cd picrust-1.0.0 && python setup.py install

RUN predict_traits.py -h
