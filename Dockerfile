FROM openjdk:8u171-jdk

ENV CLOUDTOKEN Deve_Ser_Passado_Externamente
ENV ESBNAME $HOSTNAME

RUN wget https://s3-sa-east-1.amazonaws.com/it-util/sfw/Mulesoft/esb.tar.gz &&  tar -xf esb.tar.gz
WORKDIR /mule-esb


EXPOSE 8081
EXPOSE 5701
EXPOSE 443


CMD ["/mule-esb/vertigo.sh", "run"]

