require 'spec_helper'
require 'rack/test'
require './app'

describe Application do
        # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    #test drive /GET
    context 'GET/' do
        it "returns 200 ok with the right content" do
            response = get('/')
            expect(response.status).to eq(200)
            expect(response.body).to eq('Hello')
        end  
    end

    context 'GET/' do
        it "returns 200 ok with the right content" do
            response = get('/names', names: "Julia, Mary, Karim")
            expect(response.status).to eq(200)
            expect(response.body).to eq "Julia, Mary, Karim"
        end
    end


    context 'POST/submit' do
        it "returns 200 ok with the right content" do
            response = post("/submit", name: "Tash", message: "Hi there")
            expect(response.status).to eq(200)
            expect(response.body).to eq "Thanks Tash, you sent this message: Hi there"
        end
    end

    context 'POST/sort-names' do
        it "returns 200 ok with the right content" do
            response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")
            expect(response.status).to eq(200)
            expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
        end
    end



end
