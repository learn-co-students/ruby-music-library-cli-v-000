 module Concerns::Findable
  
  def find_by_name(name)
    self.all.find do |x|
      x.name == name
    end

  end

  def create_name(name)
    self.new(name).tap {|artist| artist.save}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_name(name)
    return name
  end


end
