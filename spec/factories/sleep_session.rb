FactoryGirl.define do
  factory :sleep_session do
    deep 480
    times_woken 0
    total 480
  end
end
