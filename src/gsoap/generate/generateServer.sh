rm ../soap* ../*.nsmap
wsdl2h lacuisine.wsdl common.xsd
mkdir serviceHost
soapcpp2 -S -w -x -j -d./serviceHost/ lacuisine.h
rm lacuisine.h
wsdl2h lacuisine.wsdl service.wsdl
mkdir clientHost
soapcpp2 -C -L -w -x -j -d./clientHost/ lacuisine.h
rm lacuisine.h
cp ./serviceHost/* ../
cp ./clientHost/* ../
rm -R ./serviceHost ./clientHost
