FROM openjdk:8u171-jdk

ENV CLOUDTOKEN Deve_Ser_Passado_Externamente
ENV ESBNAME $HOSTNAME

RUN wget https://s3-sa-east-1.amazonaws.com/it-util/sfw/Mulesoft/esb.tar.gz -q &&  tar -xf esb.tar.gz
WORKDIR /mule-esb

# NON-ROOT
RUN groupadd -g 1000 mule && \
    useradd -g mule -u 1000 --system mule && \
    chown -R mule:mule /mule-esb

EXPOSE 8081
EXPOSE 5701
EXPOSE 443

USER mule

CMD ["/mule-esb/vertigo.sh", "run"]

