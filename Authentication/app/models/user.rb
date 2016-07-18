class User < ActiveRecord::Base
	after_save :clear_password
 
def clear_password
  self.password = nil
end 
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..50 }
  validates :password, :presence => true, :length => { :in => 3..500 }
  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  # validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  # attr_accessible :username, :email, :password, :password_confirmation
  # attr_accessor :password

end
