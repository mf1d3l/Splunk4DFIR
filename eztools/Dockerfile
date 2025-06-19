# inspired from https://www.sans.org/blog/running-ez-tools-natively-on-linux-a-step-by-step-guide/
# special thanks to Seth Enoka
FROM debian:bookworm

RUN apt update
RUN apt install -y wget apt-transport-https software-properties-common unzip

# install dotnet
RUN wget https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh -O /tmp/dotnet-install.sh && chmod +x /tmp/dotnet-install.sh
RUN /tmp/dotnet-install.sh --channel 9.0
ENV PATH="${PATH}:/root/.dotnet/"

# install EZTools
RUN wget https://download.ericzimmermanstools.com/net9/MFTECmd.zip -O /tmp/MFTECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/AmcacheParser.zip -O /tmp/AmcacheParser.zip
RUN wget https://download.ericzimmermanstools.com/net9/AppCompatCacheParser.zip -O /tmp/AppCompatCacheParser.zip
RUN wget https://download.ericzimmermanstools.com/net9/PECmd.zip -O /tmp/PECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/RECmd.zip -O /tmp/RECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/LECmd.zip -O /tmp/LECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/JLECmd.zip -O /tmp/JLECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/RBCmd.zip -O /tmp/RBCmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/EvtxECmd.zip -O /tmp/EvtxECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/SBECmd.zip -O /tmp/SBECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/SQLECmd.zip -O /tmp/SQLECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/SrumECmd.zip -O /tmp/SrumECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/SumECmd.zip -O /tmp/SumECmd.zip
RUN wget https://download.ericzimmermanstools.com/net9/WxTCmd.zip -O /tmp/WxTCmd.zip


RUN unzip /tmp/MFTECmd.zip -d /opt/MFTEcmd
RUN unzip /tmp/AmcacheParser.zip -d /opt/AmcacheParser
RUN unzip /tmp/AppCompatCacheParser.zip -d /opt/AppCompatCacheParser
RUN unzip /tmp/PECmd.zip -d /opt/PECmd
RUN unzip /tmp/RECmd.zip -d /opt/RECmd
RUN unzip /tmp/LECmd.zip -d /opt/LECmd
RUN unzip /tmp/JLECmd.zip -d /opt/JLECmd
RUN unzip /tmp/RBCmd.zip -d /opt/RBCmd
RUN unzip /tmp/EvtxECmd.zip -d /opt/EvtxECmd
RUN unzip /tmp/SBECmd.zip -d /opt/SBECmd
RUN unzip /tmp/SQLECmd.zip -d /opt/SQLECmd
RUN unzip /tmp/SrumECmd.zip -d /opt/SrumECmd
RUN unzip /tmp/SumECmd.zip -d /opt/SumECmd
RUN unzip /tmp/WxTCmd.zip -d /opt/WxTCmd

RUN rm /tmp/*

RUN echo "alias mftecmd='dotnet /opt/MFTEcmd/MFTECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias amcacheparser='dotnet /opt/AmcacheParser/AmcacheParser.dll'" >> /etc/bash.bashrc
RUN echo "alias appcompatcacheparser='dotnet /opt/AppCompatCacheParser/AppCompatCacheParser.dll'" >> /etc/bash.bashrc
RUN echo "alias pecmd='dotnet /opt/PECmd/PECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias recmd='dotnet /opt/RECmd/RECmd/RECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias lecmd='dotnet /opt/LECmd/LECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias jlecmd='dotnet /opt/JLECmd/JLECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias rbcmd='dotnet /opt/RBCmd/RBCmd.dll'" >> /etc/bash.bashrc
RUN echo "alias evtxecmd='dotnet /opt/EvtxECmd/EvtxeCmd/EvtxECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias sbecmd='dotnet /opt/SBECmd/SBECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias sqlecmd='dotnet dotnet /opt/SQLECmd/SQLECmd/SQLECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias srumecmd='dotnet /opt/SrumECmd/SrumECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias sumecmd='dotnet /opt/SumECmd/SumECmd.dll'" >> /etc/bash.bashrc
RUN echo "alias wxtcmd='dotnet /opt/WxTCmd/WxTCmd.dll'" >> /etc/bash.bashrc

COPY run_eztools.sh /opt/run_eztools.sh
RUN chmod +x /opt/run_eztools.sh
