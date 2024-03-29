require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'associations' do
    it { should belong_to(:course) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:company) }
  end
end
