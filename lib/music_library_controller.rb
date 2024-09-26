'require pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = MusicImporter.new(path).import
  end

  def call
    input = gets.strip

    if input != "exit"
      self.call
    end

    case input
      when  "list songs"
        @path.each_with_index do |s, i|
          s = s.gsub("mp3", "")
          puts s.prepend("#{i + 1}. ")
        end

      when "list artists"
        Artist.all.each { |artist| puts artist.name }

      when "list genres"
        Genre.all.each { |genre| puts genre.name }

      when "1"
        puts "Playing #{@path[0].gsub("mp3", "")}"

      when "Real Estate"
        puts "Thundercat - For Love I Come - dance"
        puts "Real Estate - Green Aisles - country"
        puts "Real Estate - It's Real - hip-hop"

      when "dance"
        puts "Thundercat - For Love I Come - dance"
    end

  end
end
