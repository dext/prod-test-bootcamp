class CreateJoinTableTeamUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :teams, :users, column_options: { index: true, null: false }

    change_table :teams_users do
      add_foreign_key :teams_users, :teams
      add_foreign_key :teams_users, :users
    end
  end
end
