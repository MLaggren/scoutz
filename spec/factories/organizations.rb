FactoryGirl.define do
  
  factory :organization do
    unit_type          "Cub Scouts"
    unit_number		"134"
    city					{ Faker::AddressUS.city }
    state					{ Faker::AddressUS.state }
    time_zone			"Arizona"
    
    # association                 :user
  end
end
