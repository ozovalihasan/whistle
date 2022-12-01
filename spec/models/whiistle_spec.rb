require 'rails_helper'

RSpec.describe Whiistle, type: :model do
  describe 'validations' do
    it {
      should validate_length_of(:body).is_at_least(3)
        .with_message('of your whiistle cannot be shorter than 3 letters')
    }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'scopes' do
    describe ".created_by" do
      it "returns all whiistles created by users given in an array" do
        FactoryBot.create_pair(:mock_user)
        selected_user_id = User.first.id
        FactoryBot.create_pair(:whiistle, user_id: selected_user_id)

        expect(Whiistle.created_by([User.last.id])).to be_empty
        expect( Whiistle.created_by([User.first.id]).map(&:user_id) ).to all(be selected_user_id)
      end
    end

    describe ".of_followings_and" do
      it "returns all whiistles of a user and followed users by this user" do
        FactoryBot.create_pair(:mock_user)
        Relation.create(following_id: User.first.id, followed_id: User.last.id)
        FactoryBot.create(:whiistle, user_id: User.first.id)
        FactoryBot.create(:whiistle, user_id: User.last.id)

        expect( Whiistle.of_followings_and(User.first).size ).to be(2)
      end
    end
  end
end
