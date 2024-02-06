class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :google_id
      t.text :authors, array: true

      t.timestamps
    end
  end
end
