# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

Cancer.delete_all
open("http://www.cbioportal.org/webservice.do?cmd=getTypesOfCancer") do |cancers|
  cancers.read.each_line do |cancer|
    type_of_cancer_id, cancer_name = cancer.chomp.split(/\s(.*)/)
    Cancer.create!(:cancer_name => cancer_name, :type_of_cancer_id => type_of_cancer_id)
  end
end
