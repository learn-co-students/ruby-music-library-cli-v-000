require 'pry'
module Concerns::Findable
  def find_by_name(name)
    self.all.detect do |i| i.name == name end
  end
  def find_or_create_by_name(name)
        if self.all.any?{|song| song.name == name}
        #binding.pry
        self.all.find{|list_item| list_item.name == name}
        #binding.pry
        else
        new_class_instance = self.new(name)
        new_class_instance.save
        new_class_instance
        end
  end
  def create(name) # Song.create('some name')
        instance = self.new (name)
        instance.save
        instance
  end
end
