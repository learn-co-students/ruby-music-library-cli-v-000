module Find
  def self.find_by_name(name)
    self.all.detect{|element| element.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create(name) unless self.find_by_name(name) 
  end
end


