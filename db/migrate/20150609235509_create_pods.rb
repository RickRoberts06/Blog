class CreatePods < ActiveRecord::Migration
  def change
    create_table :pods do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
