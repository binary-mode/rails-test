class Message < ApplicationRecord
  include DefaultOrder
  validates :name, :entry, :ip_address, presence: true

  scope :by_ip_address, ->(ip) { where(ip_address: ip, hidden: false).order('created_at DESC') }
  scope :by_ip_address_admin, ->(ip) { where(ip_address: ip).order('created_at DESC') }
end
