require 'rails_helper'

RSpec.describe 'Tasks API' do 
    let!(:project){ create(:project) }
    let!(:tasks){ create_list(:task, 20, project_id: project.id  ) }
    let(:project_id){ project.id }
    let(:id){ Task.first.id }
    
    describe 'Get /projects/:project_id/tasks' do 
        before { get "/projects/#{project_id}/tasks" }
        
        context 'when project exists' do 
            it 'returns status code 200' do 
                expect(response).to have_http_status(200)
            end
            
            it 'returns all project tasks' do 
                expect(json.size).to eq(20)
            end
        end
        
        context 'when project does not exist' do 
            let(:project_id){ 0 }
            
            it 'returns status code 404' do 
                expect(response).to have_http_status(404)
            end
            
            it 'returns a not found message' do 
                expect(response.body).to match(/Couldn't find Project/)
            end
        end
    end
    
    describe 'Get /projects/:project_id/tasks/:id' do 
        before { get "/projects/#{project_id}/tasks/#{id}" }
        
        context 'when the project task exists' do
            it 'returns status code 200' do 
            expect(response).to have_http_status(200)
            end
            
            it 'returns the task' do 
                expect(json['id']).to eq(id)
            end
        end 
        
        context 'when the project task does not exist' do 
            let(:id){ 21 } 
            
            it 'returns a 404 error' do 
                expect(response).to have_http_status(404)
            end
            
            it 'returns a not found message' do 
                expect(response.body).to match(/Couldn't find Task/)
            end
        end
    end
    
    describe 'Post /projects/:project_id/tasks' do 
        let(:valid_attributes){ {
            body: 'create authentication', 
            source: 'rails',
            status: 1, 
            difficulty: 5
        } }
        
        context 'when the request is valid' do 
            before { post "/projects/#{project_id}/tasks", params: valid_attributes }
            
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end
        
        context 'when invalid request' do 
            before { post "/projects/#{project_id}/tasks", params: {} }
            
            it 'returns status code 422' do 
                expect(response).to have_http_status(422)
            end
            
            it 'returns a validation failure message' do 
                expect(response.body).to match(/Validation failed/)
            end
        end
    end
    
    describe 'PUT /projects/:project_id/tasks/:id' do
        let(:valid_attributes){ {
            body: 'Build banner add', 
            source: 'Illustrator',
            status: 1, 
            difficulty: 2
        } }
        
        before { put "/projects/#{project_id}/tasks/#{id}", params: valid_attributes }
        
        context 'when the task exists' do 
            
            it 'returns status code 204' do 
                expect(response).to have_http_status(204)
            end
            
            it 'updates the task' do 
                task = Task.find(id)
                expect(task.body).to eq('Build banner add')
            end
        end
        
        context 'the item does not exist' do 
            let (:id) { 0 }
            
            it 'returns status code 404' do 
                expect(response).to have_http_status(404)
            end
            
            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Task/)
            end
        end
    end
    
    describe 'DELETE /projects/:project_id/tasks/:id' do 
        before { delete "/projects/#{project_id}/tasks/#{id}"}
        
        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end