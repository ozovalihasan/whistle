# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    subject { build(:mock_user) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:fullname) }
  end

  describe 'associations' do
    it { is_expected.to have_one_attached(:profile_picture) }
    it { is_expected.to have_one_attached(:cover_image) }
    it { is_expected.to have_many(:likes).dependent(:destroy) }
    it { is_expected.to have_many(:liked_whiistles).order('likes.created_at DESC').through(:likes).source(:whiistle) }
    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to have_many(:rewhiistles).dependent(:destroy) }
    it { is_expected.to have_many(:shared_whiistles).through(:rewhiistles).source(:whiistle) }
    it { is_expected.to have_many(:whiistles).class_name('BaseWhiistle').dependent(:destroy) }

    it {
      expect(subject).to have_many(:followed_relations).class_name('Relation').with_foreign_key('followed_id').dependent(:destroy)
    }

    it { is_expected.to have_many(:followers).through(:followed_relations).source(:following) }

    it {
      expect(subject).to have_many(:following_relations).class_name('Relation').with_foreign_key('following_id').dependent(:destroy)
    }

    it { is_expected.to have_many(:followings).through(:following_relations).source(:followed) }
  end

  describe 'scopes' do
    describe 'with_current_user_situation' do
      it 'returns a column "is_followed_by_cur_user" showing whether a user is followed by cur_user or not' do
        user1 = create(:mock_user)
        user2 = create(:mock_user)
        user3 = create(:mock_user)
        cur_user = create(:mock_user)

        user1.followers << user2
        user1.followers << user3

        cur_user.followings << user3

        expect(user1.followers.with_current_user_situation(cur_user).map(&:is_followed_by_cur_user)).to eq [false, true]
      end
    end

    describe 'in_random_order' do
      it 'returns users in a random order' do
        expect(described_class.all.in_random_order.to_sql).to include 'ORDER BY RANDOM()'
      end
    end
  end

  describe '#whiistles_of_whiistles_index_page' do
    it 'selects necessary whiistles of the user in a correct order' do
      user = create(:mock_user)
      result = []
      whiistle = create(:mock_whiistle, user:)
      result << whiistle
      flood = create(:mock_flood, user:, whiistle:)
      reply = create(:mock_reply, user:, whiistle:)

      create(:mock_rewhiistle, user:, whiistle:)
      result << whiistle
      create(:mock_rewhiistle, user:, whiistle: flood)
      result << flood
      create(:mock_rewhiistle, user:, whiistle: reply)
      result << reply

      whiistles = user.whiistles_of_whiistles_index_page
      expect(whiistles.size).to eq 4
      expect(whiistles).to eq result.reverse
    end
  end

  describe '#whiistles_of_whiistles_and_replies_index_page' do
    it 'selects necessary whiistles of the user in a correct order' do
      user = create(:mock_user)
      result = []
      whiistle = create(:mock_whiistle, user:)
      result << whiistle
      flood = create(:mock_flood, user:, whiistle:)
      reply = create(:mock_reply, user:, whiistle:)
      result << reply

      create(:mock_rewhiistle, user:, whiistle:)
      result << whiistle
      create(:mock_rewhiistle, user:, whiistle: flood)
      result << flood
      create(:mock_rewhiistle, user:, whiistle: reply)
      result << reply

      whiistles = user.whiistles_of_whiistles_and_replies_index_page
      expect(whiistles.size).to eq 5
      expect(whiistles).to eq result.reverse
    end
  end

  describe '#main_page_whiistles' do
    it 'selects necessary whiistles of followings in a correct order' do
      user = create(:mock_user)
      user2 = create(:mock_user)
      user.followings << user2

      result = []
      whiistle = create(:mock_whiistle, user: user2)
      result << whiistle
      flood = create(:mock_flood, user: user2, whiistle:)

      reply = create(:mock_reply, user: user2, whiistle:)
      result << reply
      create(:mock_reply, user: user2, whiistle: flood)
      create(:mock_reply, user: user2, whiistle: reply)

      create(:mock_rewhiistle, user: user2, whiistle:)
      result << whiistle
      create(:mock_rewhiistle, user: user2, whiistle: flood)
      create(:mock_rewhiistle, user: user2, whiistle: reply)

      create(:mock_like, user: user2, whiistle:)
      result << whiistle
      create(:mock_like, user: user2, whiistle: flood)
      create(:mock_like, user: user2, whiistle: reply)

      whiistles = user.main_page_whiistles
      expect(whiistles.size).to eq 4
      expect(whiistles).to eq result.reverse
    end
  end

  describe '#followings_and_user_ids' do
    it "returns ids of the user's followings and the user" do
      user = create(:mock_user)
      user2 = create(:mock_user)
      user.followings << user2

      expect(user.followings_and_user_ids).to eq [user2.id, user.id]
    end
  end

  describe '#suggested_users' do
    it 'returns 3 suggested users who are not followed by the user' do
      user = create(:mock_user)
      user2 = create(:mock_user)
      user.followings << user2

      create_list(:mock_user, 4)

      expect(user.suggested_users.ids).to eq((described_class.ids - [user.id, user2.id]).last(3).reverse)
    end
  end
end
