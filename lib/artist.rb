
class Artist
  extend Common::ClassMethods, Concerns::Findable
  include Common::InstanceMethods

  attr_accessor :name, 
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
    save
  end

  def self.all
    @@all
  end
  
  def add_song(song)
    song.instance_variable_set(:@artist, self) unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    songs.collect { |song| song.genre }.uniq
  end
end