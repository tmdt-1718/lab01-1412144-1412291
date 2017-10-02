class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :views
      t.attachment :source

      t.timestamps
    end
  end
end
