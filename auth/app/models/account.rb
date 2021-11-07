class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { worker: 'worker', admin: 'admin', manager: 'manager', accountant: 'accountant' }

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all # or :destroy if you need callbacks

  after_create :publish_account_created_event

  def delete_soft!
    update!(active: false, deleted_at: Time.current)
  end

  private

  def publish_account_created_event
    Events::Account::Created.new(self).publish
  end
end
