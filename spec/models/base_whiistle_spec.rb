# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseWhiistle do
  describe 'before_validations' do
    it 'updates parent_id of replies and floods' do
      create(:mock_user)
      whiistle = build(:mock_whiistle)
      expect { whiistle.valid? }.not_to change { whiistle.parent_id }

      whiistle.save
      flood = build(:mock_flood)
      expect { flood.valid? }.to change { flood.parent_id }.to 1

      reply = build(:mock_reply)
      expect { reply.valid? }.to change { reply.parent_id }.to 1
    end

    it 'updates the id of the quoted whiistle if the url of the quoted whiistle is defined' do
      create(:mock_user)
      whiistle1 = create(:mock_whiistle)
      whiistle2 = build(:mock_whiistle)
      whiistle2.quoted_whiistle_url = whiistle_url(whiistle1, host: 'example.com')

      expect { whiistle2.valid? }.to change { whiistle2.quoted_whiistle_id }.to 1
    end
  end

  describe 'validations' do
    it {
      expect(subject).to validate_length_of(:body).is_at_least(3).with_message('of your whiistle cannot be shorter than 3 letters')
    }
  end

  describe 'associations' do
    it { is_expected.to have_many_attached(:pictures) }

    it 'has ancestry' do
      create(:mock_user)
      whiistle = create(:mock_whiistle)
      reply = Reply.new(whiistle:)
      reply.valid?

      expect(reply.ancestry).to eq '1'
    end

    it {
      expect(subject).to have_many(:quoting_whiistles).class_name('BaseWhiistle').with_foreign_key('quoted_whiistle_id').dependent(:destroy)
    }

    it { is_expected.to have_many(:replies).dependent(:destroy) }
    it { is_expected.to have_many(:rewhiistles).with_foreign_key('whiistle_id').dependent(:destroy) }
    it { is_expected.to have_many(:likes).with_foreign_key('whiistle_id').dependent(:destroy) }

    it { is_expected.to belong_to(:user).counter_cache(:whiistles_count) }

    it {
      expect(subject).to belong_to(:quoted_whiistle).class_name('BaseWhiistle').optional(true).counter_cache(:quoting_whiistles_count)
    }
  end

  describe 'scopes' do
    describe 'descending_order' do
      it 'returns base_whiistles in descending order of their created time' do
        user = create(:mock_user)
        whiistle1 = create(:mock_whiistle, user:)
        whiistle2 = create(:mock_whiistle, user:)

        expect(described_class.descending_order).to eq [whiistle2, whiistle1]
      end
    end

    describe 'without_replies' do
      it 'returns base_whiistles without replies' do
        create(:mock_user)
        whiistle = create(:mock_whiistle)
        create(:mock_reply)

        expect(described_class.without_replies).to eq [whiistle]
      end
    end

    describe 'without_floods' do
      it 'returns base_whiistles without floods' do
        create(:mock_user)
        whiistle = create(:mock_whiistle)
        create(:mock_flood)

        expect(described_class.without_floods).to eq [whiistle]
      end
    end
  end

  describe 'enum' do
    it 'has enum type' do
      create(:mock_user)
      whiistle = create(:mock_whiistle)

      expect(whiistle.type).to eq('Whiistle')

      reply = build(:mock_reply)

      expect(reply.type).to eq('Reply')

      flood = build(:mock_flood)

      expect(flood.type).to eq('Flood')
    end
  end
end
