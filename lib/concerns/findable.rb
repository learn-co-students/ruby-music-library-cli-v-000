module Concerns::Findable

  def find_by_name(name)
    if !self.all.empty?
      # binding.pry
      self.all.each do |i|
        return i if i.name == name
      end
    else
      return false
    end
  end

  def find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
