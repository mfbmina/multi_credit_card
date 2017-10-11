class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.decimal :limit, :decimal, precision: 8, scale: 2, default: 0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
