require 'digest/sha1'

class User < ApplicationRecord

  EMAIL = /\A\S+@[a-z]+\.[a-z]+\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true, format: { with: EMAIL }, uniqueness: true

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
