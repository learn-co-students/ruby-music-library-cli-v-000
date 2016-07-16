class MusicLibraryController

  attr_accessor :path

def initialize(path="./db/mp3s")
  @list = MusicImporter.new(path).import
  @list.sort! if @list != nil
end

def call
		playlist = @list
    input = ""
    while input != "exit"
		input = gets.strip
		@list.each_with_index do |file, index|
			file.chomp(".mp3")
			filearr = file.split(" - ")

			case input
			when "list songs"
				puts "#{index+1}. #{file}"
			when "list artists"
				puts "#{filearr[0]}"
			when "list genres"
				puts "#{filearr[2]}"
			when "play song"
				input = gets.strip.to_i
				puts "Playing #{file}" if index+1 == input
			when "list artist"
				input = gets.strip
				playlist.each_with_index do |filee, index|
					fileearr = filee.split(" - ")
					puts "#{filee}" if input == fileearr[0]
				end
			when "list genre"
				input = gets.strip
				playlist.each_with_index do |filee, index|
					filee.chomp!(".mp3")
					fileearr = filee.split(" - ")
					puts "#{filee}" if input == fileearr[2]
        end
      end
    end
  end
end

end