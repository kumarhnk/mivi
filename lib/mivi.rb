require 'json'
class Mivi
  def self.readFile file_path
	return 'File Doesnt Exists' if !File.exist? File.expand_path file_path

  	file_data = File.read(File.expand_path file_path)
  	data_hash = JSON.parse(file_data)
  	user_attributes = data_hash["data"]["attributes"]

  	print "contact-number:\t", user_attributes["contact-number"]

  	print "\n"
  	print "email-address\t", user_attributes["email-address"]
  	print "\n"
  	print "name:\t", user_attributes["title"] + ' ' , user_attributes["first-name"] + ' ' + user_attributes['last-name']
  	print "\n"

  	puts "products:"
  	data_hash["included"].each do |products|
  		puts "\t#{products["attributes"]["name"]}" if products["attributes"]["name"]
	end
	return nil
  end
end