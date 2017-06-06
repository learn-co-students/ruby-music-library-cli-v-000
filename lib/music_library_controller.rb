class MusicLibraryController
  attr_accessor :path
  attr_reader :music_importer

  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    self.music_importer.import
  end

  def call
    commands
    input = read
    
    until input == 'exit' do
      case input
      when 'list songs'
        song_list
      when 'list artists'
        Song.all.each { |song| puts song.artist.name }
      when 'list genres'
        Song.all.each { |song| puts song.genre.name }
      when 'play song'
        choose_with_number
      when 'list artist'
        choose_from_list(:artist)
      when 'list genre'
        choose_from_list(:genre)
      end
      commands
      input = read
    end
  end

  def read
    gets.strip
  end

  def choose_from_list(method)
    song_list
    puts "\nPlease enter #{method} to list:"
    input = read
    Song.all.detect do |a|
      puts "#{a.artist.name} - #{a.name} - #{a.genre.name}" if a.send(method).name == input
    end
  end

  def choose_with_number
    song_list
    puts "\nPlease enter song number to play:"
    input = read.to_i
    music_importer.files.each_with_index do |song, index|
      puts "Playing #{song}" if index + 1 == input
    end
  end

  def song_list
    music_importer.files.each_with_index do |x, index|
      puts "#{index + 1}. #{x}"
    end
  end

  def commands
    puts "\nCommands:\nlist songs\nlist artists\nlist genres\nplay song\nlist artist\nlist genre\nexit"
  end
end
