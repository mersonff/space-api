# Space API

## Stack
- Rails 7
- Docker
- PostgreSQL
- Sidekiq
- RSpec

## Instalando Space API

Para instalar o projeto, siga estas etapas:

Setando o .env
```
copie o arquivo .env-example com o nome .env e modifique onde necessário
```

```
docker compose -f docker-compose.local.yml up
```

## Usando
Cria os bancos de dados:
```
rails db:create
rails db:create RAILS_ENV=test
```
No terminal, na pasta raiz do projeto rode o seguinte comando
```
./space-app.sh 
```

## Testes

No terminal
```
rspec
```

## Jobs
```
Para acessar a página do Sidekiq basta adicionar o path '/sidekiq' na sua url.
Ex: localhost:3000/sidekiq
```

# Docs
```
Na pasta raiz do projeto, há os arquivos para a documentação do Swagger
```

## OBS
```
Pode ser necessário dar permissão de execução para o script.
```

>  This is a challenge by [Coodesh](https://coodesh.com/)
