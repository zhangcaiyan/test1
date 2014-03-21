class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :name
      t.integer :age
      t.text :desc
      t.string :tags, array: true

      t.timestamps
    end
  end
end
