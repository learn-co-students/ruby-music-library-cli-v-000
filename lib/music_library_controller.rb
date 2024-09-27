class MusicLibraryController
  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
  end

  def call
    input = ""
    temp = ""
    while input != "exit"
      puts "Enter some input:"
      input = gets.strip
      if input == "list songs"
        counter = 1
        @importer.files.sort.each do |file|
          puts "#{counter}. #{file.split(".")[0]}"
          counter += 1
        end
      end
      if input == "list artists"
        Artist.all.each do |artist|
          puts "#{artist.name}"
        end
      end
      if input == "list genres"
        Genre.all.each do |genre|
          puts "#{genre.name}"
        end
      end
      if temp == "play song"
        input = input.to_i - 1
        puts "Playing #{@importer.files.sort[input].split(".")[0]}"
      end
      if temp == "list artist"
        result = []
        result = @importer.files.select do |file|
          file.split(" - ").include?(input)
        end
        result.each do |file|
          puts "#{file.split(".")[0]}"
        end
      end
      if temp == "list genre"
        result = []
        result = @importer.files.map do |file|
          file.split(".")[0]
        end
        result = result.select do |file|
          file.split(" - ")[-1].include?(input)
        end
        result.each do |file|
          puts "#{file}"
        end
      end


      temp = input
    end
  end

end
