class Task < ApplicationRecord
  validates :title, presence: true
  validates :priority, inclusion: { in: [ 1, 2, 3 ], message: "must be low, medium, or high" }
end
