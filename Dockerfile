# FROM java:8
FROM jruby:9
MAINTAINER Diego Correa T. (diego.correa@ikkuna.io)

# RUN apt-get install -y \
#       unzip \
#     && apt-get clean  && \
#     rm -rf /var/lib/apt/lists/*

#ADD http://nlp.stanford.edu/software/stanford-ner-2015-01-29.zip ner.zip
# ADD http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip ner.zip
# RUN unzip ner.zip

# WORKDIR /stanford-ner-2017-06-09
# ADD http://nlp.stanford.edu/software/stanford-spanish-corenlp-2017-06-09-models.jar

# ADD run.py run.py

RUN apt-get update && apt-get install -y gcc g++ make libarchive-dev python2.7 python-pip python-setuptools jruby libfindbin-libs-perl supervisor --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN \
  jruby -S gem install jruby-openssl && \
  jruby -S gem install rubygems-update && \
  update_rubygems && \
  jruby -S gem update --system && \
  jruby -S gem install opener-language-identifier && \
  jruby -S gem install opener-tokenizer && \
  jruby -S gem install opener-pos-tagger && \
  jruby -S gem install opener-tree-tagger && \
  jruby -S gem install opener-polarity-tagger && \
  jruby -J-Xmx900m -S  gem install opener-property-tagger && \
  jruby -J-Xmx900m -S gem install opener-constituent-parser && \
  jruby -J-Xmx900m -S gem install opener-ner && \
  jruby -J-Xmx900m -S gem install opener-coreference && \
  jruby -J-Xmx900m -S gem install opener-ned && \
  jruby -J-Xmx900m -S gem install opener-opinion-detector && \
  jruby -J-Xmx900m -S gem install opener-opinion-detector-basic && \
  jruby -J-Xmx900m -S gem install opener-kaf2json && \
  jruby -J-Xmx900m -S gem install opener-outlet && \
  jruby -J-Xmx900m -S gem install opener-scorer

# ENTRYPOINT ["python", "-u", "/stanford-ner-2017-06-09/run.py"]
# ENTRYPOINT ["language-identifier-server", "-p", "9000"]
# ENTRYPOINT ["tokenizer-server", "-p", "9001"]
# ENTRYPOINT ["pos-tagger-server", "-p", "9002"]
# ENTRYPOINT ["constituent-parser-server", "-p", "9003"]
# ENTRYPOINT ["ner-server", "-p", "9004"]
# ENTRYPOINT ["ned-server", "-p", "9005"]
# ENTRYPOINT ["property-tagger-server", "-p", "9006"]
# ENTRYPOINT ["polarity-tagger-server", "-p", "9007"]
# ENTRYPOINT ["opinion-detector-server", "-p", "9008"]

# ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

EXPOSE 80
EXPOSE 9000
EXPOSE 9001
EXPOSE 9002
EXPOSE 9003
EXPOSE 9004
EXPOSE 9005
EXPOSE 9006
EXPOSE 9007
EXPOSE 9008

# ENTRYPOINT ["/usr/bin/supervisord"]