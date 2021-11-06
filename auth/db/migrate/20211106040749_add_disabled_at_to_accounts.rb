class AddDisabledAtToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :disabled_at, :datetime
  end
end
