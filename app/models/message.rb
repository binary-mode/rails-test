class Message < ApplicationRecord
  include DefaultOrder
  validates :name, :entry, :ip_address, presence: true

  scope :by_ip_address, ->(ip) { where(ip_address: ip) }
  scope :by_user_name,  ->(user_name) { where(name: user_name) }
  scope :visible, -> { where(hidden: false) }

  default_scope { order(created_at: :desc) }
end
