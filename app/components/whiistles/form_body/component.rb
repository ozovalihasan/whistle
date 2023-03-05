# frozen_string_literal: true

class Whiistles::FormBody::Component < Application::Component
  def initialize(form:, label:, value: nil, open_modal: false, path: nil)
    @form = form
    @label = label
    @value = value
    @open_modal = open_modal
    @path = path
  end

end
