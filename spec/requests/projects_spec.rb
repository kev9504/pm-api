require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
    let!(:projects) { create_list(:project, 10) }
    let(:project_id) { projects.first.id }
    
    describe 'GET /projects' do
        before { get '/projects' }
        
        it 'returns projects' do
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end
        
        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end
    
    describe 'Get /projects/:id' do 
        before { get "/projects/#{project_id}" }
        
        context 'when the record exists' do 
            it 'returns the project' do 
                expect(json).not_to be_empty
                expect(json['id']).to eq(project_id)
            end
        end
        
        it 'returns status code 200' do
        expect(response).to have_http_status(200)
        end
        
        context 'when the record does not exist' do 
            let(:project_id){100}
            
            it 'returns status code 404' do 
                expect(response).to have_http_status(404)
            end
            
            it 'returns a not found message' do 
                expect(response.body).to match(/Couldn't find Project/)
            end
        end
    end
    
    describe 'Post /projects' do 
        let(:valid_attributes) { { title: 'Learn Elm', owner: '1', description: 'close project' } }
        
        context 'when the request is valid' do 
            before { post '/projects', params: valid_attributes }
            
            it 'creates a project' do 
                expect(json['title']).to eq('Learn Elm')
            end
            
            it 'returns status code 201' do 
                expect(response).to have_http_status(201)
            end
        end
        
        context 'when the request is invalid' do 
            before { post '/projects', params: {title: 'some title'}}
            
            it 'returns status code 422' do 
                expect(response).to have_http_status(422)
            end
            
            it 'returns a validation failure message' do 
            expect(response.body).to match(/Validation failed/)
            end
        end
        
        
    end
    
    describe 'Put /projects/:id' do 
        let (:valid_attributes){ {title: 'land Egypt'} }
        
        context 'when the record exists' do 
            before {put "/projects/#{project_id}", params: valid_attributes} 
            
            it 'updates the record' do 
                expect(response.body).to be_empty
            end
            
            it 'returns status code 204' do 
                expect(response).to have_http_status(204)
            end
        end
    end
    
    describe 'DELETE projects/:id' do 
        before { delete "/projects/#{project_id}"}
        it 'deleted the record' do 
            expect(response).to have_http_status(204)
        end
    end
    
    
end