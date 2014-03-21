class AddColumnPublishedAtToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :published_at, :date
  end
end
