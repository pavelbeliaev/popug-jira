class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :public_id, index: true
      t.string :full_name
      t.string :role
    end
  end
end
