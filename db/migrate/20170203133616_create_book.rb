class CreateBook < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
    	t.integer :category_id
      t.integer :user_id
      t.string :name
      t.string :author
      t.integer :year
      t.timestamps
    end
  end
end
