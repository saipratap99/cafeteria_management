class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.integer :user_id
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
