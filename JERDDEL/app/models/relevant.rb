class Relevant < ActiveRecord::Base
  belongs_to :product
  validates :tipo, presence: {message: "Obligatorio"}
  validates :product_id, presence: {message: "Obligatorio"}
end
