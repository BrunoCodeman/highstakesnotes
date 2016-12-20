class Note < ApplicationRecord
	attr_accessor :content
	belongs_to :user
	validates :content, presence: true
	validates_length_of :content, :maximum => 256, :allow_blank => false
end