class Person < ApplicationRecord
  has_secure_password
  has_one :game
  has_one :profile
   ## set default role id to 2;
   #  before_validation :set_default_role
   before_create :set_default_status

   private
   def set_default_status
    self.status = true if self.status.nil?
   end
  #  def set_default_role
  #   self.role_id = 2 if self.role_id.nil?
  #  end
end
