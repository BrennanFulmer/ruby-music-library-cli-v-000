
module Common
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      all.clear
    end

    def create(name)
      fresh = self.new(name)
      save
      fresh
    end
  end
end
