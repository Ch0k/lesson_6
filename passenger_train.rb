class PassengerTrain < Train
  include InstanceCounter
  def initialize(number)
    super
    @type = 'passenger'
  end
end