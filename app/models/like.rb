class Like < ApplicationRecord
  belongs_to :whiistle, class_name: "BaseWhiistle"
  belongs_to :user
end
