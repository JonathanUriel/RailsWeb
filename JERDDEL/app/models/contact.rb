class Contact < ActiveRecord::Base
  CONTACT_IMAGENES = File.join Rails.root, 'public', 'contact_store'
  after_save :guardar_imagen_contact

  def imagen_contact=(file_data_contact)
    unless file_data_contact.blank?
      @file_data_contact = file_data_contact
      self.extension = file_data_contact.original_filename.split(".").last.downcase
    end
  end

  def imagen_contact_filename
    File.join CONTACT_IMAGENES, "#{id}.#{extension}"
  end

  def imagen_path_contact
    "/contact_store/#{id}.#{extension}"
  end

  def has_imagen_contact?
    File.exists? imagen_contact_filename
  end

  private

  def guardar_imagen_contact
    if @file_data_contact
      FileUtils.mkdir_p CONTACT_IMAGENES
      File.open(imagen_contact_filename, 'wb') do |f|
        f.write(@file_data_contact.read)
      end
      @file_data_contact = nil
    end
  end
end
