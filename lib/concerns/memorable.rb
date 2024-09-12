# Referenced Labs
# artist-song-modules-v-000

module Memorable

  module ClassMethods

    def destroy_all
       self.all.clear
     end

     def create(name)
       temp = self.new(name)
       temp.save
       temp
     end

     def count
       self.all.count
     end

  end

  module InstanceMethods

    def save
      if self.class.all.include?(self) == false
        self.class.all << self
      end
    end

  end

end
