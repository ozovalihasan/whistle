# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::Form::Component, type: :component do
  let(:user) do
    FactoryBot.create(:mock_user)
  end

  let(:current_user_presenter) do
    cur_user = FactoryBot.create(:mock_user)
    CurrentUserPresenter.new(user)
  end
  
  context "if any optional parameter isn't provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter
        ))

      expect(rendered_content).to match_custom_snapshot("default_arguments")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: NilClass, modal_path: NilClass)')
      expect(rendered_content).to include "Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)"
    end
    
  end

  context "if a value is provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter,
          value: "mock_value"
        ))

      expect(rendered_content).to match_custom_snapshot("with_value")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: String, open_modal: NilClass, modal_path: NilClass)')
      expect(rendered_content).to include('Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)')
    end
  end

  context "if a quoted whiistle is provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter,
          quoted_whiistle: quoted_whiistle
        ))

      expect(rendered_content).to match_custom_snapshot("with_quoted_whiistle")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: NilClass, modal_path: NilClass)')
      expect(rendered_content).to include('Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)')
      expect(rendered_content).to match /input class=".*hidden" value="http:\/\/test.host\/whiistles\/\d+"/
    end
  end

  context "if the parameter 'enable_quoting_whiistle' is provided as true" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter,
          enable_quoting_whiistle: true
        ))

      expect(rendered_content).to match_custom_snapshot("with_enable_quoting_whiistle-true")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: NilClass, modal_path: NilClass)')
      expect(rendered_content).to match /input.*id="whiistle_quoted_whiistle_url"/
    end
  end

  context "if the parameter 'open_modal' is provided as true and the parameter 'modal_path' is provided" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter,
          open_modal: true,
          modal_path: "mock_path"
        ))

      expect(rendered_content).to match_custom_snapshot("with_open_modal-true")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: TrueClass, modal_path: String)')
      expect(rendered_content).not_to include "Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)"
    end
  end

  context "if the parameter 'enable_adding_floods' is provided as true and the parameter 'enable_modal' is false" do
    it "renders correctly" do
      
      whiistle = Whiistle.new
      quoted_whiistle = FactoryBot.create(:mock_whiistle, user: user)

      render_inline(described_class.new(
          form_url: "mock_url", 
          whiistle: whiistle,  
          label: "mock_label",
          current_user_presenter: current_user_presenter,
          enable_adding_floods: true
        ))

      expect(rendered_content).to match_custom_snapshot("with_enable_adding_floods-true")
      expect(rendered_content).to include('Whiistles::FormBody::Component(form: SimpleForm::FormBuilder, label: String, value: NilClass, open_modal: NilClass, modal_path: NilClass)')
      expect(rendered_content).to include('Whiistles::FormPicturesButton::Component(form: SimpleForm::FormBuilder)')
      expect(rendered_content).to include "Whiistles::FloodWhiistleForm::Component(main_form: SimpleForm::FormBuilder)"
      expect(rendered_content).to include "Add Flood"
    end
  end
end
