Instruções de Build para o Blackjack 21 em Flutter.
Olá, desenvolvedor! Este documento fornece um guia passo a passo sobre como fazer o build da nossa aplicação Flutter para a web.

Pré-requisitos:
Certifique-se de ter o Flutter SDK instalado em sua máquina. Se ainda não o fez, siga as instruções de instalação do Flutter.

Você deve ter o canal beta, dev, ou master do Flutter habilitado, já que o Flutter Web ainda está em desenvolvimento e pode não estar disponível no canal stable.

flutter channel beta
flutter upgrade

Habilitar o suporte ao Flutter Web:
flutter config --enable-web

Clonando e Preparando o Projeto:
Clone o repositório:
git clone https://github.com/rodrigo-santos-27/black-jack.git
cd nomedoprojeto

Instale as dependências:
flutter pub get

Run para a Web:
Para fazer o run da sua aplicação Flutter para a web, execute:
flutter run -d chrome --web-renderer html  

Após a conclusão do run, você visualizará a aplicação.

Build para a Web:
Para fazer o build da sua aplicação Flutter para a web, execute:
flutter build web --web-renderer html --release

Após a conclusão do build, você encontrará os arquivos de build no diretório build/web.

Dicas e Problemas Comuns:
Se você encontrar problemas relacionados a dependências, tente limpar o cache e obter as dependências novamente:

flutter pub cache repair
flutter pub get

