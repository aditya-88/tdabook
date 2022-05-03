FROM jupyter/datascience-notebook
MAINTAINER Aditya Singh <dr.singhaditya@hotmail.com>

RUN python3 -m pip install -U pip
RUN python3 -m pip install giotto-tda scikit-tda
