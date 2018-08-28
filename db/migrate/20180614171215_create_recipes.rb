class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :chef do |t|
      t.string :chefname
      t.string :email
      t.timestamps
    end
    
    #create_table :recipes do |t|
    #  t.belongs_to :chef, index :true
    #  t.string :name
    #  t.text :email
    #  t.timestamps
    #end
  end
end
