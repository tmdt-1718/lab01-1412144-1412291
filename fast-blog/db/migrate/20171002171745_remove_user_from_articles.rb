class RemoveUserFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :user, index:true, foreign_key: true
  end
end
