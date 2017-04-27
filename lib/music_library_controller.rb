require 'pry'

class MusicLibraryController

  attr_reader :path, :repertuar

  def initialize(path = "./db/mp3s")
    @path = path
    @repertuar = MusicImporter.new(path).import
  end

  def call
    puts "Hey, enter smth:"
    input = gets.chomp
  #    if input == "list songs" && !(self.repertuar.empty?)
  #      self.repertuar.each {|f| "1. #{f}"}
  #    elsif !(input == "exit")
  #      songs = MusicLibraryController.new(input)
  #      call
  #    end

    if input == "list songs"
      sorted_repertuar = self.repertuar.sort
      sorted_repertuar.each.with_index do |f, i|
        i += 1
        puts "#{i}. #{f.gsub(".mp3", "")}"
      end
      call
    elsif !(input == "exit") #it gave an infinitive loop with until ??????
        MusicLibraryController.new(input)
        call
    end

    #unless input == "exit" #it gave an infinitive loop with until ??????
    #    songs = MusicLibraryController.new(input)
    #    call
    #end
    #songs
  end

end
