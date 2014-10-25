class CreateMeigens < ActiveRecord::Migration
  def change
    create_table :meigens do |t|
      t.string :title
      t.string :body
      t.string :image_url

      t.timestamps
    end
  end
end
