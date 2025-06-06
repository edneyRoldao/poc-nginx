echo "##########################################################"
echo ""
echo "INICIANDO SCRIPT DE ATUALIZACAO BACK e FRONT - nginx poc"
echo ""
echo "##########################################################"

echo ">>>>> atualizando repositorio"
cd ~/workspace/projects/poc-nginx
git pull

echo ">>>>> parando os o container do frontend - nginx poc"
cd ~/workspace/projects/poc-nginx/front
sudo docker compose down
sudo sleep 10

echo ">>>>> recriando container frontend - nginx poc"
sudo docker-compose up --build -d

cd ~/workspace/projects/poc-nginx/back

echo ">>>>> parando as instancias do backend - nginx poc"
sudo docker compose down
sudo sleep 10

echo ">>>>> recriando as instancias do backend - nginx poc"
sudo docker-compose up --build -d
sudo sleep 10

echo ">>>>> atualizando conteudo estatico do frontend no nginx - nginx poc"
sudo mv ~/nginx-static-apps/nginx_poc_frontend/* /usr/share/nginx/html

echo ">>>>> atualizando arquivo nginx.conf - nginx poc"
sudo cp ~/workspace/projects/poc-nginx/nginx.conf /etc/nginx

echo ">>>>> recarregando NGINX - nginx poc"
sudo nginx -s reload
