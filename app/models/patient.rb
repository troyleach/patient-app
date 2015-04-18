class Patient < ActiveRecord::Base
  has_many :patient_cancers
  has_many :cancers, :through => :patient_cancer
end
