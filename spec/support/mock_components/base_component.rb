module MockComponents
  class BaseComponent < ApplicationComponent
    def initialize(component, params, &block)
      @name = component.name
      @params= params
    end

    def call
      raw(@name + params_to_s + (content ? content : ""))
    end

    def params_to_s
      return "" if @params.nil?

      "(" + @params.map {|param_key, param_value| param_key.to_s + ": " + param_value.class.name}.join(", ")  + ")"
    end
  end
end