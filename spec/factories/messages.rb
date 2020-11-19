FactoryBot.define do 
  factory :message do
    name { 'Emeka Sammy' }
    entry { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry' }
    ip_address { '192.168.0.1' }

    factory :second_message do
      name { 'Jane Smith' }
      entry { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry' }
      ip_address { '192.168.0.1' }
    end

    factory :hidden_message do
      name { 'Jane Smith' }
      entry { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry' }
      ip_address { '192.168.0.1' }
      hidden { 1 }
    end
  end
end
