class Client < ApplicationRecord
  belongs_to :visiting_for, class_name: "Type", foreign_key: "visiting_for", optional: true
end
