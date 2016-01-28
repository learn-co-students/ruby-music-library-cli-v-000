module Concerns::Findable
  def find_by_name(name)
    self.all.each{|item| return item if item.name == name}
  end

  def find_or_create_by_name(name)
    unless self.find_by_name(name)
      new_item = self.new(name) 
      new_item.save
    end
  end
end


