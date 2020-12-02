class Task < ApplicationRecord
  belongs_to :checklist
  validates :description, presence: true

  def validation?
    !completed_at.blank?
  end
end
