# frozen_string_literal: true

class PaginateRecords
  include Pagy::Backend
  attr_accessor :records, :last_page, :count
  attr_reader :original_records, :page, :url

  def initialize(original_records, page, url)
    @original_records = original_records
    @page = page || 1
    @url = url
    pagy_records
  end

  def record_exist?
    records.present?
  end

  private

  def pagy_records
    pagy, self.records = pagy(original_records, page:)
    self.last_page = pagy.last
    self.count = pagy.count
  end
end
