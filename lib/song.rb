class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    return song
  end

def self.new_by_name(name)
  song = self.new
  song.name = name
  return song
end

def self.create_by_name(name)
  song = self.new
  song.name = name
  @@all << song
  return song
end

def self.find_by_name(name)
  @@all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    return self.find_by_name(name)
  else
    return self.create_by_name(name)
end
end

def self.alphabetical
  self.all.sort_by{|x| x.name }
end

def self.new_from_filename(name)
  song = self.new
  song.name = name.split(" - ")[1].chomp(".mp3")
  song.artist_name = name.split(" - ")[0]
  song
end

def self.create_from_filename(name)
  song = self.new
  @@all << self.new_from_filename(name)
end

def self.destroy_all
  @@all.clear
end


end
