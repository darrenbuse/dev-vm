FROM ubuntu
RUN echo "Acquire::http { Proxy \"http://10.2.1.10:3142\";   };" > /etc/apt/apt.conf.d/02cache
RUN echo "Acquire::https { Proxy \"false\";   };" >> /etc/apt/apt.conf.d/02cache
RUN apt-get install -y squid
