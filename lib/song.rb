require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
    def save
    self.class.all << self
  end

  def self.create  #building class constructor
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name) #building class constructor
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name) #building class constructor
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)  #building class finder
  self.all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name) #class method
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical   #class method
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(name) #class constructor
    song = self.new
    song.artist_name = (name.split(" - ")[0])
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    # @@all << song
    song
  end
  
  def self.create_from_filename(name) #class constructor
    song = self.new
    song.artist_name = (name.split(" - ")[0])
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end

end
