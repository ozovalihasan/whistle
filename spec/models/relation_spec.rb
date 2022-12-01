require 'rails_helper'

RSpec.describe Relation, type: :model do
  describe 'validations' do
    subject {
      FactoryBot.reload;
      FactoryBot.create_pair :mock_user 
      FactoryBot.create :mock_relation 
    }
    it { should validate_uniqueness_of(:following_id).scoped_to(:followed_id) }

    it 'raises an error if followed and follower one are same ' do
      FactoryBot.reload
      FactoryBot.create(:mock_user)
      relation = Relation.new(following_id: User.first.id, followed_id: User.first.id)
      relation.valid?
      expect(relation.errors.full_messages).to include('Users cannot follow themselves')
    end
  end

  describe 'associations' do
    it { should belong_to(:followed).class_name('User') }
    it { should belong_to(:following).class_name('User') }
  end
end
