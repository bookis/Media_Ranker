class ChangeColumn < ActiveRecord::Migration
  def change
   change_column :books, :rank, :integer, :default => 0
  end
end
