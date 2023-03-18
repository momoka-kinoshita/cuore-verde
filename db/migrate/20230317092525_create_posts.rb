class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :maintitle
      t.string :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
