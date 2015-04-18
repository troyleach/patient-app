class Cancer < ActiveRecord::Base
  has_many :patient_cancer
  has_many :patients, :through => :patient_cancer
end
