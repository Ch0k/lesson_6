class CargoTrain < Train
  include InstanceCounter
  def initialize(number)
    super
    @type = 'cargo'
  end
end