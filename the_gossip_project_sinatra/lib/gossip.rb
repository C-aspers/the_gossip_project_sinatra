#require 'pry'
#require 'csv'
require 'controller'

class Gossip
  attr_accessor :author, :content

    def initialize(author, content)
      @content = content
      @author = author
    end

    def save
      #Nous ouvrons le CSV en mode écriture "ab"
      CSV.open("./db/gossip.csv", "a+") do |csv|
        csv << [@author, @content] #Nous insérons dedans une ligne avec deux colonnes
      end
    end
 
    def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end

    def self.find(id)
      csv = CSV.open("./db/gossip.csv", "a+")
      csv.each_with_index do |gossip_value, idx|
        if idx == id.to_i
          puts "#{gossip_value}".blue
        end
      end
    end  
end

#binding.pry