class Homework < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :homework_files, dependent: :destroy
  has_many :homework_assignments, dependent: :destroy
  has_many :homework_questions, dependent: :destroy
  
  accepts_nested_attributes_for :homework_questions, :reject_if => lambda { |a| a[:title].blank? }, allow_destroy: true	
  accepts_nested_attributes_for :homework_files, allow_destroy: true
end
