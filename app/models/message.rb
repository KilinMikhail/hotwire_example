class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  belongs_to :replied_to, class_name: "Message", optional: true
end
