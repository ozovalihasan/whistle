# frozen_string_literal: true

class Shared::InfiniteScrollComponent < ApplicationComponent
  def initialize(paginated_records:)
    @url = paginated_records.url
    @page = paginated_records.page
    @last_page = paginated_records.last_page
  end
end
