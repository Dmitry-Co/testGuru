class Category < ApplicationRecord
  has_many :tests

  scope :sorted_by_title, -> { order(title: :asc) }
end
