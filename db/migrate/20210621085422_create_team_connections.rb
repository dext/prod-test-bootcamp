class CreateTeamConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :team_connections do |t|
      t.belongs_to :team
      t.string :name, null: false
      t.string :connection_type, null: false
      t.string :connection_details, null: false
      t.timestamps
    end
  end
end
