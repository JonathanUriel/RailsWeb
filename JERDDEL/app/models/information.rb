class Information < ActiveRecord::Base
  belongs_to :information
  validates :history, presence: {message: "Obligatorio"}
  validates :mission, presence: {message: "Obligatorio"}
  validates :vision, presence: {message: "Obligatorio"}
  validates :objetive, presence: {message: "Obligatorio"}
  validates :values, presence: {message: "Obligatorio"}
end
