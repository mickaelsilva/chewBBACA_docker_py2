#USE BLAST BINARIES FROM UMMIDOCK REPO 
FROM ummidock/blast_binaries:2.6.0-binaries 
WORKDIR /NGStools/
RUN apt-get update
RUN apt-get install psmisc
RUN apt-get install -y git make python-dev gcc wget libxml2-dev libxslt1-dev zlib1g-dev g++ build-essential

#INSTALL PIP 
RUN apt-get install python-pip  
#GET chewBBACA and Prodigal 
RUN git clone https://github.com/hyattpd/Prodigal.git
RUN git clone https://github.com/mickaelsilva/chewBBACA.git
#INSTALL chewBBACA requirements 
WORKDIR /NGStools/chewbbaca_test
RUN pip2 install -r requirements.txt
#RUN pip2 install --upgrade numpy
#INSTALL PRODIGAL 
WORKDIR /NGStools/Prodigal
RUN make install
WORKDIR /NGStools/
#ADD chewBBACA TO PATH 
ENV PATH="/NGStools/chewBBACA:${PATH}"
