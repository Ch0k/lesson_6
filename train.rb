class Train
  NUMBER_FORMAT = /^[\d\w]{3}[-]?[\d\w]{2}$/
  @@all = []
  #include Company
  #include InstanceCounter
  attr_accessor :speed
  attr_reader :number, :type

  
  def initialize(number)
    @number = number
    @@all << self
    @wagon = []
    #register_instance
    validate!
  end
  
  def self.find(number)
    @@all.select {|a| a.number == number} 
  end
  
  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    raise "Number can't be nil" if number.nil?
    raise "Number should be at least 6 symbols" if number.length < 5
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
  end

  def add_wagon(wagon)
    @wagon << wagon if wagon.type == self.type
  end

  def self.all
    @@all
  end

  def stop
    @speed = 0
  end

  def show_trains
    @numbers.each{|station| puts station}
  end

  def route(route)
    @index = 0
    @train_route = route.show_stations
    station.reception(self)
  end

  def move_station_up
    station.send_train(self)
    @index += 1
    station.reception(self)
  end

  def move_station_down
    station.send_train(self)
    @index -= 1
    station.reception(self)
  end

  def next_station
    if @index + 1 ==  @train_route.length
      puts "End"
    else
      @next_train_station = @train_route[@index + 1]
    end
  end

  def station
    @train_route[@index]
  end
  
  def last_station
    if @index == 0 
      puts "Конечной станции нет"
    else 
      @last_train_station = @train_route[@index - 1]
    end
  end
end

