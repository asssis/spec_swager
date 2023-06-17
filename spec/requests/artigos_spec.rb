require 'swagger_helper'
def get_artigo
  { titulo: Faker::Lorem.paragraphs.first,
    texto: Faker::Lorem.paragraphs(number: [2,3,4,5].sample).join("\n"),
    autor: Faker::Name.name }
end

def get_artigo_error
  { titulo: Faker::Lorem.paragraphs.first,
    texto: Faker::Lorem.paragraphs(number: [2,3,4,5].sample).join("\n") }
end

RSpec.describe 'artigos', type: :request do
 
  path '/artigos' do

    get('list artigos') do
      tags 'Artigos'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create artigo') do
      tags 'Artigos'
      consumes 'application/json'
      parameter name: :artigo, in: :body, schema: {
        type: :object,
        properties: {
          titulo: { type: :string },
          texto:  { type: :string },
          autor:  { type: :string }
        },
        required: [ 'titulo', 'texto', 'autor' ]
      }
      request_body_example value: get_artigo, name: 'artigo'
      response(201, 'successful') do
        let(:artigo) { get_artigo }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'successful') do
        
        let(:artigo) { get_artigo_error }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/artigos/{id}' do  
    parameter name: :id, in: :path, type: :integer, description: 'codigo de artigo'
    let(:id) { Artigo.create(get_artigo).id }
    
    get('show artigo') do 
      response(200, 'successful') do  
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    patch('update artigo') do
      tags 'Artigos'
      description 'Updates Artigo'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :artigo, in: :body)

      response(200, 'successful') do
        let(:artigo) { get_artigo }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end 

    put('update artigo') do
      tags 'Artigos'
      description 'Updates Artigo'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :artigo, in: :body)

      response(200, 'successful') do
        let(:artigo) { get_artigo }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete artigo') do
      tags 'Artigos'

      response(200, 'successful') do
        after do |example| 
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
