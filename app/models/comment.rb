class Comment < ApplicationRecord
  belongs_to :my_threads
  validates :text, presence: true
end
