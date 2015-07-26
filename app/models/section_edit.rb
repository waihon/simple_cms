# Reviewed and documented.
class SectionEdit < ActiveRecord::Base

  # attribute :summary

  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section

  validates_presence_of :editor
  validates_presence_of :section
  validates_presence_of :summary

  scope :newest_first, -> { order("section_edits.created_at DESC")}

  # Not required unless we're also creating a new editor during the creation of section
  #accepts_nested_attributes_for :editor

end
