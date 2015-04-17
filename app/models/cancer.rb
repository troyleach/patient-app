class Cancer < ActiveRecord::Base
  has_many    :patients, :through => :patient_cancer
end
