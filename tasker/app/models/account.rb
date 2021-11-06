class Account < ApplicationRecord
  has_many :tasks
  scope :assignable, -> { where.not(role: %w[admin manager]) }
end
