class MusicLibraryController
  attr_accessor :path
  
  def initialize (path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
    importer
  end

  def call
    input = gets()
    if input != "exit"
      if input == "list songs"
        Song.all.each_with_index  { |song, index| puts "#{index + 1}. #{song.to_s}"}
        self.call
      elsif input == "list artists"
        Artist.all.each { |artist| puts artist.name }
        self.call
      elsif input == "list genres"
        Genre.all.each { |genre| puts genre.name }
        self.call
      elsif input == "play song"
        song_number = gets().strip.to_i
        song = Song.all[song_number-1]
        puts "Playing #{song.to_s}"
        self.call
      elsif input == "list artist"
        artist = gets()
        Song.all.each { |song| puts "#{song.to_s}" if song.artist.name == artist}
        self.call
      elsif input == "list genre"
        genre = gets()
        Song.all.each { |song| puts "#{song.to_s}" if song.genre.name == genre}
        self.call
      end
    end
  end
end