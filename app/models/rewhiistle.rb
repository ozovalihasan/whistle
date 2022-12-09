class Rewhiistle < ApplicationRecord
  belongs_to :whiistle, class_name: "BaseWhiistle"
  belongs_to :user
end
