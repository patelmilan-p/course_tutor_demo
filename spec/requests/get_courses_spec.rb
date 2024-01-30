require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'GET /index' do
    before do
      10.times { FactoryBot.create(:course_with_tutors) }
      get '/api/v1/courses.json'
    end

    it 'returns all courses' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'response matches with the courses json schema' do
      expect(response).to match_json_schema('api/v1/courses', strict: true)
    end
  end
end
