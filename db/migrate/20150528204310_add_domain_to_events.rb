class AddDomainToEvents < ActiveRecord::Migration
  def change
    add_column :events, :domain_id, :integer
  end
end
