# frozen_string_literal: true

RSpec.shared_context 'Global let helpers' do
  let(:current_user_presenter) do
    CurrentUserPresenter.new(cur_user)
  end

  let(:cur_user) do
    create(:mock_user)
  end

  let(:user) do
    create(:mock_user)
  end

  let(:whiistle) do
    user
    create(:mock_whiistle)
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.include_context 'Global let helpers', type: :component
  config.include_context 'Global let helpers', type: :view
  config.include_context 'Global let helpers', type: :feature

  config.before do
    FactoryBot.reload
  end

  config.before(:all) do
    %w[
      base_whiistles
      likes
      relations
      rewhiistles
      users
    ].each do |table|
      ActiveRecord::Base.connection.execute(
        "ALTER SEQUENCE #{table}_id_seq RESTART WITH 1000"
      )
    end
  end
end
