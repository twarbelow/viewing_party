class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.string :movie_title, null: false
      t.float :duration
      t.datetime :when
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
