require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  let!(:projects) { create_list(:project, 10) }
  let(:project_id) { projects.first.id }
  
  describe 'GET /projects' do
      before { get '/projects' }
      it 'returns projects' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end