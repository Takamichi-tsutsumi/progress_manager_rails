class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :progresses
  has_many :resources, through: :progresses

  def ensure_authentication_token
    self.authentication_token || generate_authentication_token
  end

  def generate_authentication_token
    user_id = self.id
    loop do
      old_token = self.authentication_token
      token = SecureRandom.urlsafe_base64(24).tr('lIO0', 'sxyz') + ':' + user_id.to_s
      break token if (self.update!(authentication_token: token) rescue false) &&
          old_token != token
    end
  end

  def delete_authentication_token
    self.update(authentication_token: nil)
  end
end
