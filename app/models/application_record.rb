class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def duplicate
    dup_object = self.amoeba_dup   
    if defined? self.name 
      dup_object.name = "Copy of " + self.name
    end
    return dup_object
  end
end
