class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :name
      t.string :description
      t.integer :prep_time
      t.integer :cook_time
      t.boolean :public
      t.timestamps
    end
  end
end
