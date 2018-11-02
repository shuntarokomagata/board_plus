# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :text, presence: true
end
