class RenameMbtaStopIdJustMbtaid < ActiveRecord::Migration[5.2]
  def change
    remove_column :stations, :mbta_stop_id, :string
    add_column :stations, :mbta_id, :string
  end
end
e