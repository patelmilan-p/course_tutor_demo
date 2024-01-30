require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_course) { FactoryBot.create(:course_with_tutors) }
      let!(:tutor1) { my_course.tutors[0] }
      let!(:tutor2) { my_course.tutors[1] }
      let!(:params) {
        {
          course: {
            name: my_course.name,
            description: my_course.description,
            duration: my_course.duration,
            price: my_course.price,
            tutors_attributes: {
              '0' => { name: tutor1.name, title: tutor1.title, bio: tutor1.bio,
                company: tutor1.company },
              '1' => { name: tutor2.name, title: tutor2.title, bio: tutor2.bio,
                company: tutor2.company }
            }
          }
        }
      }

      before do
        post '/api/v1/courses.json', params: params
      end

      it 'returns the name' do
        expect(json['name']).to eq(my_course.name)
      end

      it 'returns the description' do
        expect(json['description']).to eq(my_course.description)
      end

      it 'returns the duration' do
        expect(json['duration']).to eq(my_course.duration)
      end

      it 'returns the price' do
        expect(json['price']).to eq(my_course.price)
      end

      it 'returns tutors along with course' do
        expect(json['tutors'].size).to eq(2)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/courses.json', params:
                          { course: {
                            name: '',
                            description: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
