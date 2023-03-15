# frozen_string_literal: true

class Whiistles::ListWhiistles::Component < Application::Component
  def initialize(paginate_whiistles:)
    @whiistles = paginate_whiistles.records
    @current_user_presenter = paginate_whiistles.current_user_presenter
  end

end
