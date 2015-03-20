class CreateItemsTable < ActiveRecord::Migration

  def change
    create_table :items do |t|
      t.string :uri
      t.text :body

      t.timestamps
    end
  end

end
