
RSPEC + RSWAG
    • Criando um projeto novo.
		`rails new spec_swagger  --api`

    • Verificar application
              `config.api_only = true`

    • Colocar as gens no projeto local.
  	 `gem 'rspec-rails'
  		gem 'rswag-api'
  		gem 'rswag-ui'
  		gem 'rspec-rails'
 	 	  gem 'rswag-specs'
  		gem 'faker'`

    • Rodar o comando para atualizar o repositorio
              `bundle`
              
    • Rodar o comando para construir o spec testes
              `rails generate rspec:install`

    • Rodar o comando para constuir libs do swagger
              `rails g rswag:install`
			
			ou

		`rails g rswag:api:install
		 rails g rswag:ui:install
		 RAILS_ENV=test rails g rswag:specs:install`



    • Gerar as migrations

		`rails g scaffold artigo titulo:string texto:string autor:string`
		`rails g scaffold comentario texto:string qualificacao:integer nome:string artigo:references`

    • Gerar tabelas no banco
		`rails db:migrate`

    • Gerar swager
		`rails generate rspec:swagger ArtigosController`
		`rails generate rspec:swagger ComentariosController`


`rake rswag:specs:swaggerize SWAGGER_DRY_RUN=0`


`rake rswag:specs:swaggerize`
