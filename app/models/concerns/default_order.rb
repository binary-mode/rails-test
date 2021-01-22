module DefaultOrder
  extend ActiveSupport::Concern

  included do
    scope :trashed, -> { where(trashed: true) }
    
    default_scope { where(hidden: false) }
  end
end
