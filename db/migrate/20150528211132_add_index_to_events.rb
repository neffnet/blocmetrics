class AddIndexToEvents < ActiveRecord::Migration
  def change
    add_index :events, :domain_id
  end
end
