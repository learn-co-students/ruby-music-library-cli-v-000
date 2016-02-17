require_relative './music_importer.rb'

class MusicLibraryController
  attr_accessor :files, :user_input, :artists, :genres, :songs

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    @files = music_importer.files.collect {|file_name| file_name.chomp('.mp3')}
    @songs = music_importer.songs
    music_importer.import
    @artists = songs.collect{|song| song.artist.name}.uniq
    @genres = songs.collect{|song| song.genre.name}.uniq
  end

  def call
    user_input = gets.strip
    while user_input != 'exit'

      case user_input

      when 'list songs'
        files.each_with_index do |file, index|
          puts "#{index + 1}. #{file}"
        end
      when 'list artists'
        puts artists
      when 'list genres'
        puts genres
        end
      user_input = gets.strip
      end
  end
end
