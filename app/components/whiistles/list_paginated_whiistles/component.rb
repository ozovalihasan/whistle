# frozen_string_literal: true

class Whiistles::ListPaginatedWhiistles::Component < Application::Component
  def initialize(paginate_whiistles:)
    @paginate_whiistles = paginate_whiistles
  end
end
