class AddFloatLimitToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :float_limit, :decimal, precision: 8, scale: 2, default: 0
  end
end
