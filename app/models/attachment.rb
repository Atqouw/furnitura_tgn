class Attachment < ApplicationRecord

  belongs_to      :attachable,  polymorphic: true

  mount_uploader  :attach,      AttachmentUploader

  validates       :attach,
                  presence: true
end