#RTSP to HTTPS Gateway

Este projeto tem como objetivo fornecer uma solução simples para transmitir streams RTSP de câmeras IP via HTTPS usando Docker. Ele converte o fluxo RTSP da câmera para um formato acessível por navegadores, utilizando containers do Docker.

##Pré-requisitos
Antes de iniciar, é necessário ter o Docker e o Docker Compose instalados em seu sistema.

Docker
Docker Compose

##Como iniciar:

###1. Clone o repositório

git clone https://github.com/raudeliunas/rtsp.git

cd rtsp

###2. Configuração do arquivo .env:

a) Copie o arquivo .env-sample para .env:

cp .env-sample .env

b) Edite o arquivo .env com as informações da sua câmera RTSP. Abra o arquivo em um editor de texto e insira a URL da sua câmera RTSP, e a porta desejada para o stream:

RTSP_URL=rtsp://usuario:senha@ip_da_camera:porta/caminho_do_stream

STREAM_PORT=8080

Nota: O arquivo .env está sendo ignorado pelo Git (via .gitignore), garantindo que suas credenciais e configurações não sejam versionadas.

###3. Inicie os containers com Docker Compose:

Depois de configurar o arquivo .env, execute o seguinte comando para iniciar os containers:

docker compose up -d

Isso irá construir e iniciar o serviço de stream RTSP e o serviço de proxy reverso HTTPS (NGINX).

###4. Acesso via HTTPS

Após a execução, o fluxo da câmera estará disponível via HTTPS no seguinte endereço:

https://localhost:443

###5. Parar os containers

Se precisar parar os containers, basta rodar o seguinte comando:

docker compose down

###Configuração adicional

O NGINX é configurado para servir os streams via HTTPS.

Esse projeto possui um certificado auto-assinado para o host https://cameras. Para baixar o mesmo, entre no endereço:  https://localhost/certificado.html

Para garantir o funcionamento adequado em servidores locais, é necessário configurar o arquivo hosts no Windows para associar o nome do host cameras ao endereço IP do servidor onde o Docker está rodando. Isso permitirá que o serviço de proxy reverso (NGINX) resolva corretamente o nome cameras para o IP correto dentro da rede local.

Certifique-se de que o RTSP está configurado corretamente na câmera para permitir o acesso do Docker.

###Configuração em Servidores Locais

Para garantir o funcionamento correto do serviço em um ambiente local, é necessário configurar o arquivo hosts no sistema Windows. Isso permitirá que o nome do host cameras seja resolvido para o endereço IP do servidor onde o Docker está sendo executado.

Siga os passos abaixo:

1. Abrir o arquivo hosts do Windows:

- Vá até C:\Windows\System32\drivers\etc\hosts.

- Abra o arquivo com um editor de texto como administrador (por exemplo, o Bloco de Notas).

2. Adicionar a entrada do host:

- No final do arquivo, adicione a linha que associa o IP do servidor à entrada cameras. Exemplo:

192.168.1.100 cameras

Onde 192.168.1.100 é o endereço IP do servidor onde o Docker está rodando.

3. Salvar o arquivo hosts e fechar o editor de texto.

Após a configuração, o nome cameras será resolvido para o IP correto, permitindo que você acesse o stream via https://cameras no seu navegador.

##Configuração da camera

Este projeto foi configurado para transmitir vídeo via HTTPS com resolução de 640x480 a 5 FPS.

Para melhor desempenho e menor uso de CPU, recomenda-se ajustar a configuração da câmera para uma resolução próxima a 640x480 com taxa de quadros reduzida (como 5 FPS). Resoluções ou taxas de quadros mais altas exigirão mais recursos do sistema durante o processo de conversão de vídeo.


##Licença
Este projeto é licenciado sob a MIT License - veja o arquivo LICENSE para mais detalhes.
