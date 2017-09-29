class MusicLibraryController

  def initialize(path= './db/mp3s')
    importer = MusicImporter.new(path)
    @collection = importer.import
  end

  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets
      break if answer == "exit"
    end
  end

  def list_songs
    records = []
    @collection.collect do |instance|
      records << instance.split(" - ")
    end

    trimmed = records.each do |entry|
      breakup = entry[2].split(".")
      entry[2] = breakup[0]
    end

    sorted = records.sort { |a, b| a[1] <=> b[1] }

    sorted.each_with_index do |entry, index|
      sorted = entry.join(" - ")

      puts "#{index + 1}. #{sorted}"
    end
  end

  def list_artists
    records = []
    artists = []
    @collection.collect do |instance|
      records << instance.split(" - ")
    end

    records.each do |entry|
    artists <<  entry[0]
    end

    sorted = artists.sort { |a, b| a <=> b}

    sorted.uniq.each_with_index do |entry, index|
      puts "#{index + 1}. #{entry}"
      binding.pry
    end
  end
end
