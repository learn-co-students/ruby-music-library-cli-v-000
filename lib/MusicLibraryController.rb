require 'pry'
class MusicLibraryController

  attr_reader :path, :music_importer, :last_query

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
    @last_query = []
  end

  def call
    string = ''
    until string == "exit"
      string = gets.strip
      case string
      when 'list songs'
        show_songs
      when 'list artists'
        show_artists
      when 'list genres'
        show_genres
      when 'play song'
        play_songs
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      end
    end
  end

  def sort(array)
    array.sort do |a, b|
      a.artist.name > b.artist.name ? 1 : -1
    end
  end

  def list_artist
    show_artists
    selection = gets.strip
    if @last_query.include?(selection)
      all_songs_by_artist(selection)
    end
  end

  def all_songs_by_artist(artist)
    sort(Song.all).select { |e| e.artist.name == artist }.each {|e| puts "#{e.artist.name} - #{e.name} - #{e.genre.name}" }
  end

  def list_genre
    show_genres
    selection = gets.strip
    if @last_query.include?(selection)
      all_songs_by_genre(selection)
    end
  end

  def all_songs_by_genre(genre)
    sort(Song.all).select { |e| e.genre.name == genre }.each {|e| puts "#{e.artist.name} - #{e.name} - #{e.genre.name}" }
  end

  def show_songs
    sort(Song.all).each_with_index { |e, i| puts "#{i + 1}. #{e.artist.name} - #{e.name} - #{e.genre.name}"  }
  end

  def show_artists
    @last_query = Artist.all.map do |e|
      puts e.name
      e.name
    end
  end

  def show_genres
    @last_query = Genre.all.map do |e|
      puts e.name
      e.name
    end
  end

  def play_songs
    array = sort(Song.all)
    selection = gets.strip.to_i - 1
    puts "Playing #{array[selection].artist.name} - #{array[selection].name} - #{array[selection].genre.name}" if selection >= 0 and selection < array.size
  end
end
