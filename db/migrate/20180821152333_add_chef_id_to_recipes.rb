class AddChefIdToRecipes < ActiveRecord::Migration[5.1]
  def change
    change_table :recipes do |t|
      t.integer :chef_id, index: true
    end
  end
end
