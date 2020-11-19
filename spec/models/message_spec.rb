require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:name)
      should validate_presence_of(:entry)
      should validate_presence_of(:ip_address)
    end
  end

  context 'scopes' do
    it 'default_scope orders by descending with created_at' do
      first_message = create(:message)
      second_message = create(:message)

      expect(Message.all).to eq [second_message, first_message]
    end

    it 'by_ip_address scope gets messages by a particular ip address' do
      first_message = create(:message)
      second_message = create(:second_message)

      messages = Message.by_ip_address('192.168.0.1')

      expect(messages.count).to eq 2
    end

    it 'by_user_name scope gets messages by a particular user' do
      first_message = create(:message)
      second_message = create(:second_message)

      messages = Message.by_user_name(second_message.name)

      expect(messages.count).to eq 1
      expect(messages[0].name).to eq 'Jane Smith'
    end
  
    it 'visible scope gets messages that are not hidden' do
      first_message = create(:message)
      second_message = create(:second_message)
      hidden_message = create(:hidden_message)

      messages = Message.visible

      expect(messages.count).to eq 2
      expect(messages[0].hidden).to eq false
      expect(messages[1].hidden).to eq false
    end
  end
end
