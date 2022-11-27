class Request < ApplicationRecord
  belongs_to :invitee, class_name: "User"
  belongs_to :invitor, class_name: "User"
end
