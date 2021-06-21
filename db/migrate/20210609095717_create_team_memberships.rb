class CreateTeamMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :team_memberships do |t|
      t.references :user, null: false
      t.references :team, null: false
      t.string     :role, null: false
      t.string     :staff_role, null: false

      t.timestamps
    end

    add_index :team_memberships, [:user_id, :team_id], unique: true
  end
end
