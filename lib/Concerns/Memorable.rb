module Memorable
  module ClassMethods

      def destroy_all
        all.clear
      end

      def create(name)
        knew = new(name)
      knew.name = name
      knew.save
        knew
      end
  end

  module InstanceMethods

    def save
      self.class.all << self
    end
  end
end
