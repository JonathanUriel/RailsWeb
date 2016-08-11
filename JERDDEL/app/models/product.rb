class Product < ActiveRecord::Base
  belongs_to :provider
  validates :name, presence: {message: "Obligatorio"}
  validates :sale_price, presence: {message: "Obligatorio"}
  validates :purchase_price, presence: {message: "Obligatorio"}
  validates :use, presence: {message: "Obligatorio"}
  validates :cantidad, presence: {message: "Obligatorio"}
  validates :provider_id, presence: {message: "Obligatorio"}

  IMAGENES = File.join Rails.root, 'public', 'image_store'
  after_save :guardar_imagen

  def imagen=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split(".").last.downcase
    end
  end

  def imagen_filename
    File.join IMAGENES, "#{id}.#{extension}"
  end

  def imagen_path
    "/image_store/#{id}.#{extension}"
  end

  def has_imagen?
    File.exists? imagen_filename
  end

  private

  def guardar_imagen
      if @file_data
        FileUtils.mkdir_p IMAGENES
        File.open(imagen_filename, 'wb') do |f|
          f.write(@file_data.read)
        end
        @file_data = nil
      end
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      default_scoped
    end
  end
end
