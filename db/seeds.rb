require_relative "../spec/support/factory_girl.rb"



# 15.times do
#   n += 1
#   Event.create()
# end

15.times do
  FactoryGirl.create(:event)
end
