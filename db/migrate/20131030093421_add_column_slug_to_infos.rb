class AddColumnSlugToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :slug, :string
  end
end
