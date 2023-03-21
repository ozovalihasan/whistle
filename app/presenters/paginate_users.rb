# frozen_string_literal: true

class PaginateUsers < PaginateRecords
  attr_reader :cur_user

  def initialize(original_records, page, url, cur_user)
    super(original_records, page, url)

    @cur_user = cur_user
  end
end
