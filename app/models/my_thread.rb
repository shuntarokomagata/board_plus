# frozen_string_literal: true

class MyThread < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :text, presence: true
end
