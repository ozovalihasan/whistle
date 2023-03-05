module MockComponents
  module SimpleForm
    class Component < Application::Component
      def initialize(component_class:, form_key:, **kwargs)
        @component_class = component_class
        @form_key = form_key
        @kwargs = kwargs
      end

      def call
        simple_form_for Whiistle.new do |form|
          render @component_class.new(@form_key => form, **@kwargs) 
        end
      end
      
    end
  end
end