class Subscribtion < ApplicationRecord
  belongs_to :recepient, class_name: "User"
  belongs_to :subscriber, class_name: "User"
end
