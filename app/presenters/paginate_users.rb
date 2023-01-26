class PaginateUsers < PaginateRecords
  attr_reader :partial_name
  
  def initialize(original_records, page, url)
    super

    @partial_name = "users/list_users"
  end
  
end