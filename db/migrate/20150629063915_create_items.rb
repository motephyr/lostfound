class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :place
      t.datetime :found_time
      t.string :image
      t.string :source
      t.string :source_site
      t.string :source_url
      t.text :remark

      t.timestamps null: false
    end
  end
end
