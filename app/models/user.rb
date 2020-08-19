# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_one_attached :profile_picture
  has_one_attached :cover_image
  has_many :whiistles, dependent: :destroy

  def will_save_change_to_email?
    false
  end
end
