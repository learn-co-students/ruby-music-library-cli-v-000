module Concerns::Findable
  #returns the first artist that evaluates the block to true, nil if no artist exists
  def find_by_name(named)
    self.all.detect do |i|
      i.name == named
    end
  end

  #calls find_by_name. If artist is returned, will pass that artist, if nil is returned, creates new instance
  def find_or_create_by_name(named)
    if self.find_by_name(named) == nil
      self.create(named)
    else
      self.find_by_name(named)
    end
  end

end

#class methods
