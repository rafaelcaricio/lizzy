FROM zalando/python:3.4.0-4

# needed for uwsgi_metrics (treap module)
#RUN wget http://archive.ubuntu.com/ubuntu/pool/main/libs/libsigsegv/libsigsegv2_2.10-4_amd64.deb 
#RUN apt-get update && apt-get install m4 libxml2 -q -y

EXPOSE 8080

ADD .docker_data /data
RUN pip3 install --no-index --find-links=/data/wheelhouse /data/dist/*.whl

ADD scm-source.json /
ADD uwsgi.yaml /
ADD job.py /
CMD uwsgi --yaml uwsgi.yaml

