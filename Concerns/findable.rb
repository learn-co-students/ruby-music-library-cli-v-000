module Concerns::Findable


  def find_by_name(name)
    self.all.each do |i|
      return i if i.name == name
    end
  end

  def find_or_create_by_name(name)
    Song.new(name) unless Song.find_by_name(name)
  end


end
