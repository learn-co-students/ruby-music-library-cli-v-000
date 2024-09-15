class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    x=nil
    until x=="exit" do
      # puts "Please input a command: play song, list genre, list artist"
      x=gets.downcase.strip
      if x=="list songs"
        MusicImporter.cleaned.each_with_index{|item, index| puts "#{index+1}. #{item}"}
        # puts "Which song # would you like to play?"
      elsif x=="play song"
        x = gets.downcase.strip
        if x != "exit"
          puts "Playing #{MusicImporter.cleaned[x.to_i-1]}"
        end

      elsif x.include?("list artist")
        Artist.all.each_with_index{|item, index| puts "#{index+1}. #{item.name}"}
        # puts "Which artist # song's would you like to see?"
        x = gets.strip
        if x.downcase != "exit"
          Artist.find_by_name(x).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        end
      elsif x.include?("list genre")
        Genre.all.each_with_index{|item, index| puts "#{index+1}. #{item.name}"}
        # puts "Which genre # song's would you like to see?"
        x = gets.downcase.strip
        if x != "exit"
          Genre.find_by_name(x).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
        end
      end

    end
  end
end
