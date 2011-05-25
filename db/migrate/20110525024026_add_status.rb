class AddStatus < ActiveRecord::Migration
  def self.up
    add_column :places, :status, :string
  end

  def self.down
    remove_column :places, :status
  end
end
