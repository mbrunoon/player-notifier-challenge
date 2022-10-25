namespace :players  do

    require 'net/http'
    require 'json'

    task :update => :environment do

        desc "Updating teams and players to database..."                

        dataPlayers = getDataPlayers
        return if dataPlayers.nil?

        dataPlayers.each do |data_player|
            player = Player.find_by(name: data_player["name"])            
            next if player.blank?
            player.assign_attributes(data_player)
            player.save if player.changed?
        end

        puts "Players updated."
    
    end


    def getDataPlayers
        teams_and_players = Net::HTTP.get(URI("https://raw.githubusercontent.com/RealFevr/challenge/master/data/players.json"))    
        teams_and_players = JSON.parse(teams_and_players)
        return teams_and_players["data"]["teams"].map{|i| i["players"]}.flatten
    rescue => e
        puts e
        return nil
    end    

end
