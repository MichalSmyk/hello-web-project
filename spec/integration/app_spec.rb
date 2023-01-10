require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do 
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'GET /hello' do
        it 'should return "Hello Mike"' do
            response = get('/hello')

            expect(response.status).to eq(200)
            expect(response.body).to include('<h1>Hello!</h1>')
        end
        
    end

    context 'GET /names' do 
        it 'returns names' do 
            response = get('/names?names=Julia, Mary, Karim')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Julia, Mary, Karim')
        end
    end


    context 'POST /sort_names' do 
        it 'sorts the names alphabetically' do 
            response = post('/sort_names?names=Joe,Alice,Zoe,Julia,Kieran')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
        end
    end
end 