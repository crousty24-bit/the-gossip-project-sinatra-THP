require 'csv'
class Gossip
  attr_accessor :author, :content
  def initialize(author, content)
    @author = author
    @content= content
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("db/gossip.csv").each do |csv_line| #use .read (!.open "ab" is for editing)
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    return Gossip.all[id.to_i]
  end

  def self.update(id, author, content)
    CSV.read("db/gossip.csv")
    gossips = self.all
    gossips[id.to_i].author = author
    gossips[id.to_i].content = content
    CSV.open("db/gossip.csv", "w") do |csv|
      gossips.each do |new|
        csv << [new.author, new.content]
      end
    end
  end
end