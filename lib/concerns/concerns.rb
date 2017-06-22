module Concerns::ClassMethods
    def create(name)
      new_obj = self.new(name)
      new_obj.save
      new_obj
    end

    def destroy_all
      self.all.clear
    end
end

module Concerns::InstanceMethods

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    self.class.all << self
  end

end

module Concerns::Findable

  def find_by_name(name)
    self.all.detect{|obj| obj.name == name}
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end

module Concerns::Searchable

  def list_by_name
    list = self.all.sort{|a,b| a.name <=> b.name}.uniq
    list.each_with_index{|obj,ind| yield(obj,ind)}
  end

  def list_songs_from(source)
    list = source.songs.sort{|a,b| a.name <=> b.name}.uniq
    list.each_with_index{|obj,ind| yield(obj,ind)}
  end


end
