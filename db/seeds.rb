require 'net/http'
require 'json'


teams_and_players = Net::HTTP.get(URI("https://raw.githubusercontent.com/RealFevr/challenge/master/data/players.json"))    
teams_and_players = JSON.parse(teams_and_players)
teams_and_players = teams_and_players["data"]["teams"]

teams_and_players.each do |team|
    puts "Inserting '#{team["name"]}' and players."
    Team.create({
        name: team["name"],
        acronym: team["acronym"],
        players_attributes: team["players"]
    })
end

User.create(email: "admin@admin.com", password: "admin@admin", name: "Admin")