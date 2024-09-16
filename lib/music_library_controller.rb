class MusicLibraryController
  attr_accessor :path,:importer

  def initialize(path="./db/mp3s")
    self.path = path
    self.importer = MusicImporter.new(path)
    self.importer.import
  end

  def call
    puts "Welcome to Music Library v1.0."
    running = true
    while running
      print "Enter a command:"
      input = gets.chomp
      case input
      when "exit"
        running = false
      when "list songs"
        Song.list_songs
      when "list artists"
        Artist.all.each{|artist| puts artist.name}
      when "list genres"
        Genre.all.each{|genre| puts genre.name}
      when "play song"
        print "Enter song number:"
        input2 = gets.chomp
        if input2.to_i > 0 && input2.to_i <= Song.all.length
          puts "Playing #{Song.all[input2.to_i-1].print_song}"
        end
      when "list artist"
        print "Enter an artist:"
        input2 = gets.chomp
        found = Artist.find_by_name(input2)
        if found
          found.songs.each do |song|
            puts song.print_song
          end
        end
      when "list genre"
        print "Enter an genre:"
        input2 = gets.chomp
        found = Genre.find_by_name(input2)
        if found
          found.songs.each do |song|
            puts song.print_song
          end
        end
      end
    end
  end
end
