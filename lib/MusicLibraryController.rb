require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    @files = MusicImporter.new(path).import
  end
  def call
  input = " "
  num = nil
    until input == "exit"
      input = gets.chomp
            if input == "list songs"
               @files.sort.each.with_index{|x,i| puts "#{i+1}. #{x.slice(0, x.size-4)}\n"}
            elsif input == "list artists"
              Artist.all.each{|x| puts x.name}
            elsif input == "list genres"
              Genre.all.each{|x| puts x.name}
            elsif input == "list artist"
              name = gets.chomp
              @files.each{|x| puts x.slice(0, x.size-4) if x.gsub(" - ", ',').split(',')[0] == name}
            elsif input == "list genre"
             name = gets.chomp
             @files.each{|x| puts x.slice(0, x.size-4) if x.gsub(" - ", ',').split(',')[2] == "#{name}.mp3"}
            elsif input == "play song"
              num = gets.chomp
              @files.sort.each.with_index do
                  |x,i| if num.to_i - 1 == i
                  puts "Playing #{x.slice(0, x.size-4)}"
               end
          end
      end
   end
 end
end
