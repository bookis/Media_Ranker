class ChangeAlbums < ActiveRecord::Migration
  def change
    change_column :albums, :rank, :integer, :default => 0
  end
end
