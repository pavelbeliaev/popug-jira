class Account < ApplicationRecord
  has_many :tasks
  enum role: { worker: 'worker', admin: 'admin', manager: 'manager', accountant: 'accountant' }
  scope :assignable, -> { where.not(role: %w[admin manager]) }
end
