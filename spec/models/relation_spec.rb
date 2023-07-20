# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relation do
  describe 'validations' do
    subject do
      create_pair(:mock_user)
      create(:mock_relation)
    end

    it { is_expected.to validate_uniqueness_of(:following_id).scoped_to(:followed_id) }

    it 'raises an error if followed and follower one are same' do
      create_pair(:mock_user)
      relation = described_class.new(following_id: User.first.id, followed_id: User.first.id)
      relation.valid?
      expect(relation.errors.full_messages).to include('Users cannot follow themselves')
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:followed).class_name('User') }
    it { is_expected.to belong_to(:following).class_name('User') }

    it 'updates the followings_count of a user' do
      user1 = create(:mock_user)
      user2 = create(:mock_user)

      expect { described_class.create(following: user1, followed: user2) }.to change { user1.followings_count }.by(1)
    end

    it 'updates the followers_count of a user' do
      user1 = create(:mock_user)
      user2 = create(:mock_user)

      expect { described_class.create(following: user1, followed: user2) }.to change { user2.followers_count }.by(1)
    end
  end

  describe 'scope' do
    it 'returns relations in descending order of their created time' do
      create_list(:mock_user, 3)
      create_list(:mock_relation, 2)

      expect(described_class.descending_order).to eq described_class.all.reverse
    end
  end
end
