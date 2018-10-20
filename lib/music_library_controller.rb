require_relative './concerns/findable.rb'
require 'pry'


class MusicLibraryController

  attr_accessor :path

  def initialize(path)
    @path= path    
  end


end