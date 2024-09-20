class Attachment < ApplicationRecord
  belongs_to :record, polymorphic: true
  
  has_many_attached :files

end
