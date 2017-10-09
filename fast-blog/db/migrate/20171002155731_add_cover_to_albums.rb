class AddCoverToAlbums < ActiveRecord::Migration[5.1]
  def up
   add_attachment :albums, :cover
 end

 def down
   remove_attachment :albums, :cover
 end
end
