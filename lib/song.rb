class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(title)
    @@all.find { |song| song.name.include?(title)}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    # @@all.sort_by{|song| song.name}
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    song_data = file.split(" - ")
    name = song_data[0]
    song_title = song_data[1].gsub(/.mp3/, "")
    song = Song.new
    song.artist_name = name
    song.name = song_title
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song

  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

end
