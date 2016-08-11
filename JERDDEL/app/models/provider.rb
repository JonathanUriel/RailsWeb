class Provider < ActiveRecord::Base
  belongs_to :state
  validates :name, presence: {message: "Obligatorio"}
  validates :phone, presence: {message: "Obligatorio"}
  validates :street, presence: {message: "Obligatorio"}
  validates :colony, presence: {message: "Obligatorio"}
  validates :number, presence: {message: "Obligatorio"}
  validates :state_id, presence: {message: "Obligatorio"}

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      default_scoped
    end
  end
end
