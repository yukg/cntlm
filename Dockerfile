FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y build-essential

RUN cd /opt && git clone https://github.com/versat/cntlm.git
RUN cd /opt/cntlm && ./configure && make && make install

ADD run.sh /run.sh
RUN chmod +x /run.sh
ENV CNTLM_NO_PROXY "localhost, 127.0.0.*, 10.*, 192.168.*, *.local"
EXPOSE 3128

ENTRYPOINT ["/run.sh"]
CMD [""]