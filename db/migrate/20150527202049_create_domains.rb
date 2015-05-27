class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end

  add_index :domains, :url, unique: true
  end
end
