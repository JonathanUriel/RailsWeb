class Video < ActiveRecord::Base
  validates :tipo, presence: {message: "Obligatorio"}
  validates :url, presence: {message: "Obligatorio"}
end
