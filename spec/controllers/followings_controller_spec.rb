require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  before(:all) do
    User.create([{ username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa' },
                 { username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@hasan.hasan', password: 'aaaaaa', password_confirmation: 'aaaaaa' }])
  end

  context 'when there is no any user signed in' do
    describe 'create action' do
      it "doesn't allow to access " do
        post :create, params: { followed_id: User.first.id }
        expect(Following.all.size).to eq 0
      end
    end

    describe 'destroy action' do
      it "doesn't allow to access " do
        Following.create(user_id: User.second.id, followed_id: User.first.id)
        delete :destroy, params: { followed_id: User.first.id, id: User.second.id }
        expect(Following.all.size).to eq 1
      end
    end
  end

  context 'when there is a user signed in', authenticated: true do
    describe 'create action' do
      it 'creates a following ' do
        sign_in User.second
        post :create, params: { followed_id: User.first.id }
        expect(Following.all.size).to eq 1
      end
    end

    describe 'destroy action' do
      it 'deletes a following defined by valid attributes ' do
        sign_in User.second
        Following.create(user_id: User.second.id, followed_id: User.first.id)
        delete :destroy, params: { followed_id: User.first.id, id: User.second.id }
        expect(Following.all.size).to eq 0
      end
    end
  end
end
