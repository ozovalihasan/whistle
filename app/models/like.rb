class Like < ApplicationRecord
  belongs_to :whiistle, class_name: "BaseWhiistle", counter_cache: true
  belongs_to :user
end
