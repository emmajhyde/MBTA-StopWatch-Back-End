class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :station, foreign_key: true
      t.string :desc, null: false

      t.timestamps
    end
  end
end
