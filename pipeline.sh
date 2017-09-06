cat test.txt | \
curl -F 'input=<-' "http://192.168.99.100:9000" | \
curl -F 'input=<-' "http://192.168.99.100:9001" | \
curl -F 'input=<-' "http://192.168.99.100:9002" | \
curl -F 'input=<-' "http://192.168.99.100:9003" | \
curl -F 'input=<-' "http://192.168.99.100:9004" | \
curl -F 'input=<-' "http://opener.olery.com/ned" | \
curl -F 'input=<-' "http://opener.olery.com/property-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/polarity-tagger" | \
curl -F 'input=<-' "http://opener.olery.com/opinion-detector"