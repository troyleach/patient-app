class Patient < ActiveRecord::Base
  has_many    :cancers, :through => :patient_cancer
end
