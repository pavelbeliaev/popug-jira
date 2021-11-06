class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :account_id, index: true
      t.string :description
      t.integer :price
      t.integer :fee
      t.datetime :completed_at
      t.string :status, default: 'active'
      t.uuid :public_id, default: 'gen_random_uuid()', null: false, index: true

      t.timestamps
    end
  end
end
