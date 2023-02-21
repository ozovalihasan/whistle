# frozen_string_literal: true

class Whiistles::FormBodyComponent < ApplicationComponent
  def initialize(form:, label:, value: nil, open_modal: false)
    @form = form
    @label = label
    @value = value
    @open_modal = open_modal
  end

end
