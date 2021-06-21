class CreateTeamRoles< ActiveRecord::Migration[6.1]
  def change
    create_table :team_roles do |t|
      t.references :user, null: false
      t.references :team, null: false
      t.string     :role, null: false
      t.string     :staff_role, null: false

      t.timestamps
    end

    add_index :team_roles, [:user_id, :team_id], unique: true
  end
end
