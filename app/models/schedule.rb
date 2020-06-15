class Schedule < ApplicationRecord
  has_many :answer, dependent: :destroy

  default_scope -> { order(ymd: :asc) }

  scope :uketsukechu, -> { where("schedules.ymd > ?", Time.current.yesterday) }
end
