class UsersController < ApplicationController
    require 'zip'
	def generate_zip
	  begin
		zipname = 'archive.zip'
		temp_file = Tempfile.new(zipname)
	    folder = "/home/user/Desktop"
		input_filenames = ['image.png']

	    Zip::OutputStream.open(temp_file) { |zos| }
		Zip::File.open(temp_file.path, create: true) do |zipfile|
		  input_filenames.each do |filename|
		    # add your files here
		    zipfile.add(filename, File.join(folder, filename))
		  end
		end
		zip_data = File.read(temp_file.path)
		send_data(zip_data, :type => 'application/zip', :filename => zipname)
	  ensure
	    #Close and delete the temp file
	    temp_file.close
	    temp_file.unlink
	  end
    end
end
