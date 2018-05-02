docker pull store/oracle/weblogic:12.2.1.2
docker tag  store/oracle/weblogic:12.2.1.2 $1:5000/weblogic-1221
docker push $1:5000/weblogic-1221
docker image rm $1:5000/weblogic-1221
docker image rm store/oracle/weblogic:12.2.1.2
