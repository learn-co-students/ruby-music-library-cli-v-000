module Concerns::Findable

  def create_by_name(name)
    self.new(name).tap {|song| song.save}
  end

  def find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

end