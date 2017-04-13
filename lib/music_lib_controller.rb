class MusicLibraryController
  attr_accessor :playlist

  def initialize(path = "./db/mp3s")
    @playlist = MusicImporter.new(path).tap {|mimporter| mimporter.import}
  end

  def call
    response = ''
    while response != "exit"
      #system('clear')
      gen_output(response)
      response = gets.strip
    end
  end

  def gen_output(response)
    case response
      when ''
        puts "Please enter a command!"
      when /list songs/i
        self.playlist.printer
      when /list artists/i
        Artist.printer
      when /list genres/i
        Genre.printer
      when /list artist/i
        #Artist.list
        self.list_artist
      when /list genre/i
        #Genre.list
        self.list_genre
      when /play song/i
        self.play_song
    end
  end

  def list_artist
    puts "Please type the name of the artist!"
    name = gets.strip
    Artist.find_by_name(name).songs.each{|song| puts song.slugify}
  end

  def list_genre
    puts "Please type the name of the genre!"
    name = gets.strip
    Genre.find_by_name(name).songs.each{|song| puts song.slugify}
  end

  def play_song
    puts "Please type the number of the song to play!"
    num = gets.strip.to_i - 1
    slug = Song.all[num].slugify
    puts "Playing #{slug}"
  end
end
