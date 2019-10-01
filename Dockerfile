FROM openjdk:8u171-jdk

ENV CLOUDTOKEN Deve_Ser_Passado_Externamente
ENV ESBNAME $HOSTNAME

RUN groupadd -g 1000070000 mule
RUN useradd -m -g mule -u 999 --system mule

USER mule
WORKDIR /home/mule
RUN wget https://it-util.s3-sa-east-1.amazonaws.com/sfw/Mulesoft/mule-ee-distribution-standalone-3.9.3-hf1.zip &&  unzip mule-ee-distribution-standalone-3.9.3-hf1.zip && rm mule-ee-distribution-standalone-3.9.3-hf1.zip

WORKDIR /home/mule/mule-enterprise-standalone-3.9.3-hf1/bin
RUN wget https://it-util.s3-sa-east-1.amazonaws.com/sfw/Mulesoft/start_mule.sh
RUN chmod +x start_mule.sh

EXPOSE 8081
EXPOSE 5701
EXPOSE 443

CMD ["./start_mule.sh"]
