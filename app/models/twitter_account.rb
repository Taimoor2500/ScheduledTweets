require "x"

class TwitterAccount < ApplicationRecord
  has_many :tweets,  dependent: :destroy
  belongs_to :user
  validates :username, uniqueness: true

   def client
  x_credentials = {
  api_key:             'Csd1zHOz2ycQn8Y68nwZ0X4I0' ,
  api_key_secret:      'm3ldTRXeZecMPwVi5taI3r5dT9XYrX3x9KaDGAYRar26N2YW8w',
  access_token:         self.token,
  access_token_secret: self.secret,
}
   X::Client.new(**x_credentials)
end

end