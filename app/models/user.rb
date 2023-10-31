class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true, uniqueness: true

  scope :tests_by_level, ->(level) {
    joins(:tests).merge(Test.where(level: level))
  }
end
