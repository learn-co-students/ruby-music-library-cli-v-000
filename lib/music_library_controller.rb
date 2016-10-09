class MusicLibraryController
  VALID_COMMANDS = [
    "list songs",
    "list artists",
    "list genres",
    "play song",
    "list artist",
    "list genre",
    "exit"
  ]
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Please enter command or 'exit'"
    command = ""
    while command != "exit" do
      command = gets.strip
      if VALID_COMMANDS.include?(command)
        case command
          when "list songs"
            number = 0
            Song.all.each do |song|
              number += 1
              string = number.to_s
              puts "#{string}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          when "list artists"
            array = Song.all.collect{|song|song.artist.name}
            array.uniq!
            array.each do |artist|
              puts "#{artist}"
            end
          when "list genres"
            array = Song.all.collect{|song|song.genre.name}
            array.uniq!
            array.each do |genre|
              puts "#{genre}"
            end
          when "play song"
            number = gets.strip.to_i
            song = Song.all[number - 1]
            puts "#Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
          when "list artist"
            name = gets.strip
            Song.all.each do |song|
              if song.artist.name == name
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
              end
            end
          when "list genre"
            name = gets.strip
            Song.all.each do |song|
              if song.genre.name == name
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
              end
            end
        end
      else
        puts "Command invalid!"
      end
    end
  end

end
