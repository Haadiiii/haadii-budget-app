class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups, through: :group_expenses
  has_many :group_expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
