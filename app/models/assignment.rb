class Assignment < ApplicationRecord
  belongs_to :checklist
  belongs_to :user
end
