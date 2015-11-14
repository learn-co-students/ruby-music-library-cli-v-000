module Concerns::Findable
  def find_by_name(name)
    @@all.each {|song| return song if song.name == name}
    nil
  end

  def find_or_create_by_name(name)
    
  end
end
