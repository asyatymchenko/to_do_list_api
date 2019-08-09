class Task < ApplicationRecord
	validates :title, presence: true, uniqueness: true

	scope :done_tasks, ->{where(:done => true)}
	scope :undone_tasks, ->{where(:done => false)}
end
