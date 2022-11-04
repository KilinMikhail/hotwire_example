class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles, dependent: :destroy

  has_many :sent_subscribtions, class_name: "Subscribtion", foreign_key: :recepient_id,
    inverse_of: :recepient, dependent: :destroy
  has_many :received_subscribtions, class_name: "Subscribtion", foreign_key: :subscriber_id,
    inverse_of: :subscriber, dependent: :destroy
  
  has_many :subscribed_users, through: :received_subscribtions, source: :subscriber
  has_many :subscribed_to_users, through: :sent_subscribtions, source: :recepient
end
