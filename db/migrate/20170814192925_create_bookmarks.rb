class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.references :topic, foreign_key: true

      t.timestamps null: false
    end
  end
end
