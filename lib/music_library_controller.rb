class MusicLibraryController
   attr_accessor :path
   def initialize p="./db/mp3s"
     @path=p
     i=MusicImporter.new(p)
     i.files
     i.import
   end
   def call
     loop do c=gets
        if(c=="exit")
          break
        elsif(c=="list songs")
          Song.all.each_with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
        elsif(c=="list artists")
          Artist.all.each { |s| puts s.name }
        elsif(c=="list genres")
          Genre.all.each { |s| puts s.name }
        elsif(c=="play song")
          curs=Song.all[gets.to_i - 1]
          puts "Playing #{curs.artist.name} - #{curs.name} - #{curs.genre.name}"
        elsif(c=='list artist')
          cura=Artist.find_or_create_by_name(gets)
          cura.songs.each { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
        elsif(c=='list genre')
          cura=Genre.find_or_create_by_name(gets)
          cura.songs.each { |s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
        end
     end
   end
end
