module Concerns
  module Persistable

    module InstanceMethod
      def save # Instance Method
        self.class.all << self
      end
    end

    module ClassMethods
      def destroy_all #Class Method
        self.all.clear
      end

      def create(name) #Class Method
        o = self.new(name)
        o.save
        o
      end

      # def self.create(name) #Class Method
      #   song = Song.new(name)
      #   song.save
      #   song
      # end
    end



  end
end
