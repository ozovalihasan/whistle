require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    User.create(username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    User.create(username: 'hasan', fullname: 'Hasan Ozovali', email: 'hasan@gmail.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    User.first.whiistles.create(body: 'This is a test')
    User.second.following_relations.create(followed_id: User.first.id)
  end

  context 'when there is no any user signed in' do
    describe 'show action' do
      it 'is not allowed to access ' do
        get :show, params: { id: User.first.id }
        expect(@controller.instance_variable_get(:@user)).to eq nil
      end
    end
  end

  context 'when there is a user signed in' do
    describe 'show action' do
      it 'returns user, whiistles wanted and followers of the user ' do
        sign_in User.first
        get :show, params: { id: User.first.id }
        expect(@controller.instance_variable_get(:@whiistles).size).to eq 1
        expect(@controller.instance_variable_get(:@user)).to eq User.first
        expect(@controller.instance_variable_get(:@followers)[0]).to eq User.second
      end
    end
  end
end
