require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    collection = @@all.any?{|n| n.name == name}
    binding.pry
    if collection.size == 0
      @@all << self
    end
  end

  def add_song(song)
    @songs << song
  end

  def add_song_by_name(song)
    binding.pry
    add_song(song)
  end

  def self.find_or_create_by_name(name)
    collection = @@all.select{|n| n.name == name}
    if collection.size == 0
      newartist = Artist.new(name)
      #@@all << newartist
      return newartist
    end
    collection[0]
  end

  def print_songs
    @songs.each do |n|
      puts n.name
    end
  end

  def self.song_count
    Song.all.size
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
