# frozen_string_literal: true

class PaginateUsers < PaginateRecords
  attr_reader :cur_user

  def initialize(original_records, page, url, cur_user)
    original_records = original_records.with_current_user_situation(cur_user).with_attached_profile_picture
    super(original_records, page, url)

    @cur_user = cur_user
  end
end
