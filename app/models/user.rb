class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :validatable, :timeoutable
         # :registerable, :recoverable, :rememberable, :trackable, :confirmable, :lockable, :omniauthable


end
