class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :number
      t.date :due_date
      t.date :exp_date
      t.integer :cvv
      t.decimal :limit, :decimal, precision: 8, scale: 2, default: 0
      t.decimal :spent_value, :decimal, precision: 8, scale: 2, default: 0
      t.belongs_to :wallet, index: true

      t.timestamps
    end
  end
end
