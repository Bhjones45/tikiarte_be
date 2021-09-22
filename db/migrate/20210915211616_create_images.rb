class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :status, default: "private"
      t.string :tags
      t.string :description
      t.string :title
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
