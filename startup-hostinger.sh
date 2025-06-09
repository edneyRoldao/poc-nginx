echo "##########################################################"
echo ""
echo "INICIANDO SCRIPT DE ATUALIZACAO BACK e FRONT - nginx poc"
echo ""
echo "##########################################################"

echo ""
echo "---------------------------------"
echo ">>>>> atualizando repositorio - - nginx poc <<<<<"
echo "---------------------------------"
cd ~/projects/poc-nginx
git pull

echo ""
echo "---------------------------------"
echo ">>>>> recriando container frontend - nginx poc <<<<<"
echo "---------------------------------"
cd ~/projects/poc-nginx/front
docker-compose down
docker rm nginx-poc-front
docker rmi nginx-poc-front-img
docker-compose up --build -d

sleep 40

echo ""
echo "---------------------------------"
echo ">>>>> atualizando conteudo estatico do frontend no nginx - nginx poc <<<<<"
echo "---------------------------------"
sudo cp -r ~/nginx-static-apps/nginx_poc_frontend/* /usr/share/nginx/html
sudo cp ~/projects/poc-nginx/codemize.online.conf /etc/nginx/sites-available
sudo systemctl restart nginx

echo ""
echo "---------------------------------"
echo ">>>>> habilitando o app em sites-enabled - nginx poc <<<<<"
echo "---------------------------------"
sudo ln -s /etc/nginx/sites-available/codemize.online.conf /etc/nginx/sites-enabled/


echo ""
echo "---------------------------------"
echo ">>>>> recriando as instancias do backend - nginx poc <<<<<"
echo "---------------------------------"
cd ~/projects/poc-nginx/back
docker-compose down
docker rmi nginx-poc-back
docker-compose up --build -d
