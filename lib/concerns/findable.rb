module Concerns::Findable
	def find_by_name(name)
    names = self.all.each do |i|
      if i.name == name then return i end
    end
    nil
  end
  def find_or_create_by_name(name)
    if self.find_by_name(name) then return self.find_by_name(name) end
    self.create(name)
  end
end