# frozen_string_literal: true

class Shared::PaginateWhiistlesComponent < ApplicationComponent
  def initialize(paginated_whiistles:)
    @type = paginated_whiistles.type
    @user = paginated_whiistles.user
    @whiistles = paginated_whiistles.records
  end
end
