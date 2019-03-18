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
    song = Song.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.create
    
    # new_arr will give us the artist_name automatically
    new_arr = filename.split('-')
    
    # This splits the second element in new_arr which represents the song name by the period to get rid of the extension and ultimately leads us to the song name in the first element of the new array
    song_name_arr = new_arr[1].split('.')
    song.artist_name = new_arr[0].strip
    song.name = song_name_arr[0].strip
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end
end
