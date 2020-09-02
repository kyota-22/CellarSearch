class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :drinks
  has_many :foods
  has_many :sakes
  has_many :wines

  # def self.ransackable_attributes(auth_object = nil)
  #   %w[name, addres, station]
  # end
end
