class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses, through: :group_expenses
  has_many :group_expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
