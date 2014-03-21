class CreateDailiIps < ActiveRecord::Migration
  def change
    create_table :daili_ips do |t|
      t.string :name
      t.integer :port

      t.timestamps
    end
  end
end
