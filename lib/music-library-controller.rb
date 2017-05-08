class MusicLibraryController

attr_accessor :importer

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
    # binding.pry
  end

  def call
    input = ""
    # binding.pry
    while input != "exit"
      # puts "Welcome to your Library"
      # puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        i = 1
        importer.files.sort.each do |file|
          puts "#{i}. #{file}"
          i += 1
        end

      when "list artists"
        puts Artist.all.map {|artist| artist.name}.sort

      when "list genres"
        puts Genre.all.map {|genre| genre.name}.sort

      when "play song"
        input = gets.strip
        list = importer.files.sort
        puts "Playing #{list[input.to_i-1]}"

      when "list artist"
        input = gets.strip
        artist = importer.files.find_all {|artist| artist.include? input}
        puts artist.sort

      when "list genre"
        input = gets.strip
        genre = importer.files.find_all {|genre| genre.include? input}
        puts genre.sort
      end



    end
  end
end
