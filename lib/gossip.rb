require 'csv'
class Gossip 
	attr_accessor :author, :description, :all_gossips

def initialize (author, description)
	@author = author
	@description = description
end
	
def save 
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @description]
  end
end
def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end
end

#Gossip.new("super_auteur", "super gossip").save