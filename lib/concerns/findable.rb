module Concerns::Findable

  def find_by_name(name)
    self.all.select {|x| x.name == name}[0]
  end

  def find_or_create_by_name(name)
    if find_by_name(name)==nil
      self.new(name).save
    else
      find_by_name(name)
    end
  end

  #   def self.find_by_name(name)
#     @@all.select {|x| x.name == name}[0]
#   end

#   def self.find_or_create_by_name(name)

#     if find_by_name(name)==nil
#       Song.new(name).save
#     else
#       find_by_name(name).name = name
#     end
#     name
#     #binding.pry
#   end


end