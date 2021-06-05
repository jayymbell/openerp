class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def duplicate
    dup_object = self.amoeba_dup   
    dup_object.name = "Copy of " + self.name unless self.name.nil?
    return dup_object
  end
end
