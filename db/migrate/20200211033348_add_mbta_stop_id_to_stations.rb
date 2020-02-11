class AddMbtaStopIdToStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :mbta_stop_id, :string
    remove_column :stations, :url_path, :string
  end
end
