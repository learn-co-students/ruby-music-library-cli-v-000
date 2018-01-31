module Concerns::Findable
  
  def self.find_by_name
    all.detect { |song| song.name == name }
  end

end
