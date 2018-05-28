class Course < ApplicationRecord
  validates :course_id, presence: true, format: { with: /\A[a-z0-9\-]+\z/i }, length: { maximum: 20 }
  validates :course_title, presence: true, format: { with: /\A[a-z0-9 ]+\z/i }, length: { maximum: 50 }
  validates :topic, length: { maximum: 100 }
  validates :price, presence: true, numericality: true, inclusion: { in: 1..999999 }
  validates :level_id, presence: true, numericality: true, inclusion: { in: 1..5 }
  validates :category, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 40 }

  def self.search(search)
    if search
      Course.where(['course_id LIKE :keyword OR course_title LIKE :keyword OR topic LIKE :keyword OR category LIKE :keyword', keyword: "%#{search}%"])
    else
      Course.all
    end
  end

  def self.searchCategory(search)
    if search
      Course.where(['category LIKE :keyword', keyword: "%#{search}%"])
    else
      Course.all
    end
  end

end
