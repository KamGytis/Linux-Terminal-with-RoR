class Folder < ApplicationRecord
  # Link a folder to its parent folder (optional: true allows the root folder to have no parent)
  belongs_to :parent, class_name: "Folder", optional: true
  
  # Link a folder to its subfolders
  has_many :subfolders, class_name: "Folder", foreign_key: "parent_id", dependent: :destroy
  
  # Link a folder to its files
  has_many :terminal_files, dependent: :destroy
end