cat test.txt | \
curl -F 'input=<-' "http://172.17.42.1:9000" | \
curl -F 'input=<-' "http://172.17.42.1:9001" | \
curl -F 'input=<-' "http://172.17.42.1:9002" | \
curl -F 'input=<-' "http://172.17.42.1:9003" | \
curl -F 'input=<-' "http://172.17.42.1:9004" | \
curl -F 'input=<-' "http://172.17.42.1:9005" | \
curl -F 'input=<-' "http://172.17.42.1:9006" 