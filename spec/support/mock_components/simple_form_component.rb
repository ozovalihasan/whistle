module MockComponents
  class SimpleFormComponent < ApplicationComponent
    def initialize(test_component_class:)
      @test_component_class = test_component_class
    end

    def call
      simple_form_for Whiistle.new do |form|
        render @test_component_class.new(form: form) 
      end
    end
    
  end
end