# frozen_string_literal: true

require "rails_helper"

RSpec.describe Application::Component, type: :component do
  it "has a method 'filter_attribute' to filter a given argument" do

    VARIANT_VALUES = {
      default: "default",
      non_default: "non_default"
    }.freeze
    
    application_component = Application::Component.new

    expect(application_component.send(:filter_attribute, nil, VARIANT_VALUES.keys)).to eq(nil)
    expect(application_component.send(:filter_attribute, :default, VARIANT_VALUES.keys, default: :default)).to eq(:default)
    expect(application_component.send(:filter_attribute, :non_existing_key, VARIANT_VALUES.keys, default: :default)).to eq(:default)
    expect(application_component.send(:filter_attribute, :non_default, VARIANT_VALUES.keys, default: :default)).to eq(:non_default)
  end
  
  it "doesn't render anything" do
    expect { render_inline(described_class.new) }.to raise_error ViewComponent::TemplateError
  end
end
