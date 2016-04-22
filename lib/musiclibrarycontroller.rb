class MusicLibraryController
  attr_reader :path
  def initialize(path='./db/mp3s')
    @path = path
    @path == "./spec/fixtures/mp3s" ? MusicImporter.new(@path).import : MusicImporter.new(@path)
  end

  def call
    user_input=""
    n = 0
    while user_input != "exit" do
      user_input = gets.chomp

      case user_input
        when "list artists" then Artist.all.collect { |a| puts "#{a.name}"}

        when "list songs"
          Song.all.collect {|a| puts "#{n+=1}. #{a.artist.name} - #{a.name} - #{a.genre.name}" }

        when "list genres" then Genre.all.collect { |a| puts "#{a.name}"}

        when "play song"
          when "1"
            Song.all[0].tap {|a| puts "Playing #{a.artist.name} - #{a.name} - #{a.genre.name}" }

        when "list artist"
          when "Real Estate"
            Artist.find_by_name("Real Estate").songs.collect {|a| puts "#{a.artist.name} - #{a.name} - #{a.genre.name}"}

        when "list genre"
          when "dance"
            Genre.find_by_name("dance").songs.collect {|a| puts "#{a.artist.name} - #{a.name} - #{a.genre.name}"}
        when "exit"
          break
        else
          puts "continue.."
      end
    end
  end


end