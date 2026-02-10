require_relative '../lib/app/gossip'
require 'csv'

describe Gossip do
  #changing file path to gossip_test before all tests
  before(:each) do
    Gossip.db_file = "./db/gossip_test.csv"
  #empty csv test before each tests
    CSV.open("./db/gossip_test.csv", "w") {}
  end

  describe '#initialize' do
    it 'creates a gossip with author and content' do
      gossip = Gossip.new("Batman", "Le Joker est en ville")
      expect(gossip.author).to eq("Batman")
      expect(gossip.content).to eq("Le Joker est en ville")
    end
  end

  describe '#save and .all' do
    it 'saves a gossip to the CSV and retrieves it' do
      gossip = Gossip.new("Robin", "Batman dort")
      gossip.save
      all_gossips = Gossip.all
      expect(all_gossips.length).to eq(1)
      expect(all_gossips.first.author).to eq("Robin")
      expect(all_gossips.first.content).to eq("Batman dort")
    end
  end

  describe '.find' do
    it 'finds a gossip by its index' do
      Gossip.new("Auteur 1", "Contenu 1").save
      Gossip.new("Auteur 2", "Contenu 2").save
      found_gossip = Gossip.find(1)
      expect(found_gossip.author).to eq("Auteur 2")
      expect(found_gossip.content).to eq("Contenu 2")
    end
  end
end