class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    User.create(:email => 'admin@admin.com', :username => 'admin', :password => 'admin')
  end
end
