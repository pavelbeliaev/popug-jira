class RenameDisabledAtOnAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :disabled_at, :deleted_at
  end
end
