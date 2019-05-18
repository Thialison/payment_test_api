### Payment_TEST_API
Projeto de teste de API REST com Ruby + HTTParty + Rspec

#### Estrutura do projeto
    -   contracts [Pasta com os json's da API]
    -   services [Pasta com as classes, métodos e endpoints da API]
    -   spec [Pasta com os cenários de teste da API]

#### Configurando ambiente com Ruby

```ruby
1. Instalando e configurando o rbenv:
   brew install rbenv
   echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
   rbenv install -l
   rbenv install 2.5.3
   rbenv local 2.5.3
   
2. Instalando o gerenciador de gems do ruby:
   gem install bundler
```

#### Executando o Projeto :dart:

```ruby
1. Faça um clone do projeto:
   git clone https://github.com/Thialison/payment_test_api.git

2. Acesse a pasta do projeto e baixe as dependências do projeto:
   bundle

3. Executando todos os cenários com geração de um report html:
   rake spec
   
4. Executando cenários com tags): 
   Ex.: rspec spec --tag @buyer
```
