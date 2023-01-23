class PaginateRecords < ApplicationService
  include Pagy::Backend
  attr_reader :original_records, :records, :page, :last_page, :url, :partial_name
  
  def initialize(original_records, page, url, partial_name)
    @original_records = original_records
    @page = page ? page : 1
    @url = url
    @partial_name = partial_name
    pagy_records
  end

  def pagy_records
    pagy, @records = pagy(original_records, page: page)
    @last_page = pagy.last
  end
  
end