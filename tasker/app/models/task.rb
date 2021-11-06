class Task < ApplicationRecord
  belongs_to :account, optional: true
  enum status: { active: 'active', completed: 'completed' }

  scope :assignable, -> { active }
end
