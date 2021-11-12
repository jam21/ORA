class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # belongs_to :creator, foreign_key: :created_by, class_name: :User
  # belongs_to :last_editor, foreign_key: :last_updated_by, class_name: :User
end
