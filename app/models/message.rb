class Message < ApplicationRecord
  include DefaultOrder
  validates :name, :entry, :ip_address, presence: true

  scope :by_ip_address, ->(ip) { where(ip_address: ip) }

  default_scope { order(created_at: :desc) }
end
