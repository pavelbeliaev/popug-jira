class AddFieldsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :full_name, :string
    add_column :accounts, :role, :string
    add_column :accounts, :balance, :integer, default: 0, null: false
    add_column :accounts, :public_id, :uuid, default: 'gen_random_uuid()', null: false
    add_column :accounts, :active, :boolean, default: true, null: false

    add_index :accounts, :public_id
  end
end
