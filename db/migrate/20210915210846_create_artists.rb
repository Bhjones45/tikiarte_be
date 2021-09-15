class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :username
      t.string :password_digest
      t.references :director, foreign_key: true
      
      t.timestamps
    end
  end
end
