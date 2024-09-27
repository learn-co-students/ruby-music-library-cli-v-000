require 'pry'
class MusicImporter
    attr_reader :path, :filenames

    def initialize(path = "./db/mp3s")
        @path = path
        @filenames = ''
        return self
    end

    def files
        mp3s = Dir.entries(@path)
        mp3s.select do |file|
            file.end_with?(".mp3")
        end
    end

    def import
        @filenames = self.files
        @filenames.each do |file|
            Song.create_from_filename(file)
        end
        return self
    end

end

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        @music_importer = MusicImporter.new(path).import
    end

    def call
        loop do
            input = gets.chomp
            case input
            when "list songs"                 
                @music_importer.filenames.sort!.each_with_index do |filename, index|
                    puts "#{index+1}. #{filename}"
                end
                
            when "list artists"
                artists = Artist.all
                artists.sort! do |x,y| x.name <=> y.name end
                artists.each do |artist| puts artist.name end
            when "list genres"
                genre = Genre.all
                genre.sort! do |x,y| x.name <=> y.name end
                genre.each do |genre| puts genre.name end

            when "play song"
                i = gets.chomp
                puts "Playing #{@music_importer.filenames.sort![i.to_i-1]}"

            when "list artist"
                artist = gets.chomp
                Artist.find_by_name(artist).songs.each do |song| 
                    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" 
                end
            when "list genre"
                genre = gets.chomp
                Genre.find_by_name(genre).songs.each do |song| 
                    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" 
                end
            when "exit"
                break 

            end

        end
    end
end