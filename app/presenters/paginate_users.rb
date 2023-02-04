class PaginateUsers < PaginateRecords
  attr_reader :component
  
  def initialize(original_records, page, url, cur_user)
    super(original_records, page, url)

    @component = Users::UserComponent.with_collection records, cur_user: cur_user
  end
  
end