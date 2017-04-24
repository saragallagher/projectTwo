class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.text :ingredients
      t.string :title
      t.text :instructions
      t.string :time
      t.integer :difficulty_level
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
