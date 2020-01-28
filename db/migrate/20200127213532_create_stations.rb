class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :desc, null: false
      t.string :url_path

      t.timestamps
    end
  end
end
