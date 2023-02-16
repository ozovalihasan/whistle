# frozen_string_literal: true

class Whiistles::FormComponent < ApplicationComponent
  def initialize(form_url:, whiistle:, label:, value: nil, quoted_whiistle: nil, enable_quoting_whiistle: nil, enable_adding_floods: nil)
    @form_url = form_url
    @whiistle = whiistle
    @label = label
    @value = value
    @quoted_whiistle = quoted_whiistle
    @enable_quoting_whiistle = enable_quoting_whiistle
    @enable_adding_floods = enable_adding_floods
  end

end
