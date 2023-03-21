# frozen_string_literal: true

module Shared
  module InfiniteScroll
    class Component < Application::Component
      def initialize(paginate_records:)
        @url = paginate_records.url
        @page = paginate_records.page
        @last_page = paginate_records.last_page
      end
    end
  end
end
