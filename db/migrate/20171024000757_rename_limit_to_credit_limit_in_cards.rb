class RenameLimitToCreditLimitInCards < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :limit, :real_limit
  end
end
