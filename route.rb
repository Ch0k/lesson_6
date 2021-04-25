class Route
  include InstanceCounter
  @@all = []
  # Имеет начальную и конечную станцию, а также список промежуточных станций. 
  # Начальная и конечная станции указываютсся при создании маршрута, 
  # а промежуточные могут добавляться между ними.
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    @@all << self
  end

  def self.all
    @@all
  end

  # Может добавлять промежуточную станцию в список
  def add_station(station)
    @stations.insert(-2, station)
  end

  # Может удалять промежуточную станцию из списка
  def del_station(station)
    @stations.delete(station)
  end

  # Может выводить список всех станций по-порядку от начальной до конечной
  def show_stations
    @stations.each{|station| puts station.name}
  end

  def show_first_station
    @first_station
  end
  
end
