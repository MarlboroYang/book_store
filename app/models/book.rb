class Book < ApplicationRecord
  has_many :vote_logs, dependent: :destroy
end