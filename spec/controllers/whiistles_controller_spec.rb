require 'rails_helper'

RSpec.describe WhiistlesController, type: :controller do
  before(:all) do
    delete_all_tables
    User.create(username: 'hillary', fullname: 'Hillary Kiptoo', email: 'hillary@hillary.hillary', password: 'aaaaaa', password_confirmation: 'aaaaaa')
    User.first.whiistles.create(body: 'This is a test')
  end

  context 'when there is no any user signed in' do
    describe 'index action' do
      it 'is not allowed to access ' do
        get :index, params: { followed_id: User.first.id }
        expect(@controller.instance_variable_get(:@whiistles)).to eq nil
      end
    end

    describe 'create action' do
      it 'is not allowed to access ' do
        post :create, params: { body: 'This is a ttest' }
        expect(Whiistle.all.size).to eq 1
      end
    end
  end

  context 'when there is a user signed in' do
    describe 'index action' do
      it 'returns all whiistles wanted ' do
        sign_in User.first
        get :index, params: { followed_id: User.first.id }
        expect(@controller.instance_variable_get(:@whiistles).size).to eq 1
      end
    end

    describe 'create action' do
      it 'creates a whiistle ' do
        sign_in User.first
        post :create, params: { whiistle: { body: 'This is a test' } }
        expect(Following.all.size).to eq 0
      end
    end
  end
end
