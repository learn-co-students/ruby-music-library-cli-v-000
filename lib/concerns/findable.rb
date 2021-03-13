require 'pry'

module Concerns::Findable
  def find_by_name(name)
    all.detect{|song| song.name == name}
  end
  
  def find_or_create_by_name(name)
  # self.find_by_name(name) || self.create(name) #Q&A video refactor
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end
end