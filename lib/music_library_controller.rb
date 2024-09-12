require_relative '../config/environment.rb'

 class MusicLibraryController
   attr_accessor :path

   def initialize(path="./db/mp3s") #initialize the MusicLibraryController object and import files as Song/Artist/Genre objects
     @path = path
     music = MusicImporter.new(@path)
     files = music.import
   end

   def call
     puts "Welcome to the Music Library CLI! Type \"help\" to get started."
     help_options = ["list songs : list all songs", "list artists : list all artists", "list genres : list all genres",
       "play song : play a song", "list artist : list all songs by artist", "list genre : list all genres an artist belongs to",
      "exit : exit the program"]
     prompt = "> "
     print prompt
    while user_input = gets.chomp # loop while getting user input
       case user_input
       when "list songs"
        Song.all.each_with_index do |song, index|
           puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
         end
         print prompt
       when "list artists"
         Artist.all.each do |artist|
           puts "#{artist.name}"
         end
         print prompt
       when "list genres"
         Genre.all.each do |genre|
           puts "#{genre.name}"
        end
         print prompt
       when "play song"
         print "Please select a song number: "
         i = gets.chomp
         Song.all.each_with_index do |song, index|
           if i.to_i == index + 1
             puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
           end
         end
         print prompt
      when "list artist"
         print "Please type an artist: "
         i = gets.chomp
         Artist.all.each do |artist|
           if i == artist.name
             artist.songs.each do |song|
               puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
             end
           end
         end
         print prompt
       when "list genre"
         print "Please type a genre: "
         i = gets.chomp
         Genre.all.each do |genre|
           if i == genre.name
             genre.songs.each do |song|
               puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
             end
           end
         end
         print prompt
       when "help"
         puts "Command list:"
         help_options.each do |option|
           puts option
         end
         print prompt
       when "exit"
         puts "Goodbye!"
         break
       else
         puts "Please select a valid command. Type \"help\" for a full list."
         print prompt
       end
     end
   end

 end
