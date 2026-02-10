require 'csv'
class Gossip
  attr_accessor :author, :content
  @@db_file = "./db/gossip.csv" #assign default file to class variable
  def self.db_file=(path) #method to change file (for tests)
    @@db_file = path
  end

  def initialize(author, content)
    @author = author
    @content= content
  end

  def save
    CSV.open(@@db_file, "ab") do |csv| #using var instead of 'hard' csv path file
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read(@@db_file).each do |csv_line| #use .read (!.open "ab" is for editing)
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    return Gossip.all[id.to_i]
  end

  def self.update(id, author, content)
    CSV.read(@@db_file)
    gossips = self.all
    gossips[id.to_i].author = author
    gossips[id.to_i].content = content
    CSV.open(@@db_file, "w") do |csv|
      gossips.each do |new|
        csv << [new.author, new.content]
      end
    end
  end
end