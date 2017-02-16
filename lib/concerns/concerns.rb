module Concerns
  module Save
    module ClassMethods
      @@all = []

      def all
        @@all
      end

      def destroy_all
        all.clear
      end

      def create(name)
        new(name).tap{|x| x.save}
      end
    end

    module InstanceMethods
      def save
        self.class.all << self
      end
    end
  end

  module Findable
    def find_by_name(name)
      all.find{ |x| x.name == name }
    end

    def find_or_create_by_name(name)
      search = find_by_name(name)
      search ? search : create(name)
    end
  end
end
