FROM ubuntu

MAINTAINER Austin G. Davis-Richardson <harekrishna@gmail.com>

RUN apt-get update

RUN apt-get install -y python-pip python-dev wget

# install Python dependencies

RUN pip install numpy==1.5.1
RUN pip install biom-format==1.3.1
# The latest version is 1.5.3 but for some reason when I install with
# `pip install cogent==1.5.3` I get an ImportError.
RUN pip install cogent

RUN wget https://github.com/picrust/picrust/releases/download/1.0.0/picrust-1.0.0.tar.gz

RUN tar -zxvf picrust-1.0.0.tar.gz

RUN cd picrust-1.0.0 && python setup.py install

# run one of the scripts to make sure the installation worked
RUN predict_traits.py -h
