# frozen_string_literal: true

class Whiistles::Form::Component < Application::Component
  def initialize(
                  form_url:, 
                  whiistle:, 
                  label:, 
                  current_user_presenter:,
                  value: nil, 
                  quoted_whiistle: nil, 
                  enable_quoting_whiistle: nil, 
                  enable_adding_floods: nil, 
                  open_modal: nil,
                  modal_path: nil
                )
                
    @form_url = form_url
    @whiistle = whiistle
    @label = label
    @current_user_presenter = current_user_presenter
    @value = value
    @quoted_whiistle = quoted_whiistle
    @enable_quoting_whiistle = enable_quoting_whiistle
    @enable_adding_floods = enable_adding_floods
    @open_modal = open_modal
    @modal_path = modal_path
  end

end
