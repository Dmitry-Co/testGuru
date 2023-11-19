class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User'
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level, message: 'The same name and level already exists!' }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :names_by_category, -> (category_name) {
    joins(:category)
      .where(categories: { title: category_name })
  }

  def self.sorted_names_by_category(category_name)
    names_by_category(category_name).order(title: :desc).pluck(:title)
  end

  def questions_count
    questions.size
  end
end
