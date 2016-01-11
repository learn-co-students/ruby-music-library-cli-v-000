module Concerns::InstanceActionable
    
  def save
    self.class.all << self
  end

  def songs
    @songs
  end

end