# frozen_string_literal: true

class Users::PaginateWhiistles::Component < Application::Component
  def initialize(paginate_whiistles:)
    @paginate_whiistles = paginate_whiistles
  end

end
