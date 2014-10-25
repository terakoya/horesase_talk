class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :content
      t.string :image_url

      t.timestamps
    end
  end
end
