# docker-jenkins-with-docker
Imagem baseada no seguinte link:

		https://github.com/jenkinsci/docker.

# Building
Rode o seguinte comando para gerar sua imagem

		docker build -t jenkins .

# Docker in docker
Para que o docker funcione dentro da imagem docker você precisa compartilhar o socket da máquina host com o container adicionando um volume da seguinte forma

		-v /var/run/docker.sock:/var/run/docker.sock

# Crie um grupo chamado Docker na máquina HOST

		sudo groupadd docker

# Crie o usuário Jenkins na máquina HOST

		UBUNTU: sudo adduser jenkins
		CENTOS: sudo useradd jenkins

# Adicione usuário Jenkins no grupo Docker para que o mesmo consiga acessar o Docker daemon

		sudo usermod -aG docker jenkins

# Mantendo os dados do Jenkins salvos no host
Para manter os dados do container Jenkins criamos um volume com o caminho que preferir na sua estrutura de arquivos

		-v /your/path/shared/:/var/jenkins_home:rw

# Mapeando a porta do HOST:CONTAINER
Com esse comando estará mapeando a porta 8080 do Host para a 8080 do container, note que você poderá apontar para qualquer porta do HOST caso a mesma esteja em uso.

		-p 8080:8080
	
# Dando privilegio de acesso ao HOST

		--privileged=true

# Start ao iniciar a máquina Host
Caso queira que seu container JENKINS inicie junto com o SO adicione o seguinte comando

		--restart=always

# Rode em background

		-d
	
# Execute o container Jenkins com todos os parâmetros

		docker run \
		-d \
		--name jenkins \
		-p 8080:8080 \
		-p 5000:50000 \
		--restart=always \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v /your/path/shared/:/var/jenkins_home:rw \
		--privileged=true \
		jenkins
