# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! email: 'john@example.com', password: '123456' # TODO use '1'?

user.password = '1'
user.password_confirmation = '1'
user.save! validate: false

a_team = Team.create! name: 'A-Team',     location: 'Accountantshire'
b_team = Team.create! name: 'Team Bravo', location: 'Bravoshire'

magneto = Client.create! name: 'Magneto', user_id: user.id, team_id: a_team.id, provider: 'Provider', business_type: 'partnership'
charles = Client.create! name: 'Charles', user_id: user.id, team_id: a_team.id, provider: 'Provider', business_type: 'partnership'

cyclops = Client.create! name: 'Cyclops', user_id: user.id, team_id: b_team.id, provider: 'Provider', business_type: 'partnership'
jubilee = Client.create! name: 'Jubilee', user_id: user.id, team_id: b_team.id, provider: 'Provider', business_type: 'partnership'

TeamMembership.create! user_id: user.id, team_id: a_team.id, role: 'admin'
TeamMembership.create! user_id: user.id, team_id: b_team.id, role: 'admin'
