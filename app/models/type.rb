class Type < ApplicationRecord
  has_many :clients, foreign_key: "visiting_for"
end
