class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :timeoutable
         # :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :omniauthable
end
