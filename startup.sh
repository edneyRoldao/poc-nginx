echo "##########################################################"
echo ""
echo "INICIANDO SCRIPT DE ATUALIZACAO BACK e FRONT - nginx poc"
echo ""
echo "##########################################################"

echo ""
echo "---------------------------------"
echo ">>>>> atualizando repositorio - - nginx poc <<<<<"
echo "---------------------------------"
cd ~/workspace/projects/poc-nginx
git pull

echo ""
echo "---------------------------------"
echo ">>>>> recriando container frontend - nginx poc <<<<<"
echo "---------------------------------"
cd ~/workspace/projects/poc-nginx/front
docker-compose down
docker rm nginx-poc-front
docker rmi nginx-poc-front-img
docker-compose up --build -d

sleep 300

echo ""
echo "---------------------------------"
echo ">>>>> atualizando conteudo estatico do frontend no nginx - nginx poc <<<<<"
echo "---------------------------------"
cp -r ~/nginx-static-apps/nginx_poc_frontend/* /usr/share/nginx/html
cp ~/workspace/projects/poc-nginx/nginx.conf /etc/nginx
nginx -s reload

echo ""
echo "---------------------------------"
echo ">>>>> recriando as instancias do backend - nginx poc <<<<<"
echo "---------------------------------"
cd ~/workspace/projects/poc-nginx/back
docker-compose down
docker rmi nginx-poc-back
docker-compose up --build -d
