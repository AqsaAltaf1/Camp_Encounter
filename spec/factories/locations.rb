FactoryBot.define do
  factory :location do
    title {"lahore"}
    camp_location {'lahore'}
    start_date { DateTime.now }
    end_date {'20 March 2023'}

  end
end
