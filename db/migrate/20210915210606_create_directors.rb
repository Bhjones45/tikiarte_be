class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :email
      t.string :token
      t.string :google_id

      t.timestamps
    end
  end
end
