module Concerns::Findable
  def self.find_by_name(name)
    self.all.detect { |a| a.name == name }
  end

  def self.find_or_create_by_name(name)
     self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end
end
