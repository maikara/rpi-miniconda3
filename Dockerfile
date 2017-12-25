FROM resin/rpi-raspbian

RUN apt-get update && \
    apt-get install -y bzip2 wget

ENV PATH /opt/conda/bin:$PATH

RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -bfp /opt/conda && \
    rm /tmp/miniconda.sh

RUN apt-get remove -y bzip2 wget && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log

CMD ["/bin/bash"]
