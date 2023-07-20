# frozen_string_literal: true

class Reply < BaseWhiistle
  belongs_to :whiistle, class_name: 'BaseWhiistle', foreign_key: 'base_whiistle_id', counter_cache: true
end
