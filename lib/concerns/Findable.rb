module Concerns::Findable

  def find_by_name(name)
    self.all.detect do |o|
      o.name == name
    end
  end

#invokes the extended class's .create method - this is why it's called mixin
  def find_or_create_by_name(name)
      find_by_name(name) || create(name) #Artist and Genre both have this method. You cannot transfer to here because no way to abstract it. Has to call .new on specific Class cannot use self.
  end



end
