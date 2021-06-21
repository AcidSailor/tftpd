FROM ubuntu

RUN apt-get update && \
    apt-get install tftpd-hpa -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 69/udp

WORKDIR /tftpd

COPY runner.sh .

RUN chmod u+x runner.sh

ENV TFTP_USERNAME="tftp"
ENV TFTP_DIRECTORY="/srv/tftp"
ENV TFTP_ADDRESS=":69"

ENTRYPOINT [ "/tftpd/runner.sh" ]

CMD [ "--secure" ]