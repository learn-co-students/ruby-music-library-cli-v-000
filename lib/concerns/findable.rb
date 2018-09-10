module Concerns::Findable
  
  def find_by_name(name)
  found = nil
  self.all.each {|song|
      if song.name.include?(name)
        found = song
      end}
  found
  end

  def find_or_create_by_name(name)
  self.find_by_name(name) || self.create(name)
  end

end
