class Vehicle {
  String model;
  int capacity;
  String engine;

  // Constructor por defecto que inicializa todas las variables
  Vehicle() : model = '', capacity = 0, engine = '';

  // Constructor por nombre para inicializar desde el motor
  Vehicle.fromEngine(String engine) : model = '', capacity = 0, this.engine = engine;

  // Constructor por nombre para inicializar con capacidad
  Vehicle.withCapacity(int capacity) : model = '', this.capacity = capacity, engine = '';

  // Otro constructor por nombre para una inicialización personalizada
  Vehicle.custom(this.model, this.capacity, this.engine);

  // Método para imprimir detalles del vehículo
  void displayDetails() {
    print('Model: $model, Capacity: $capacity, Engine: $engine');
  }
}

// Clase con Constructor de Fábrica (Patrón Singleton)
class DBConnection {
  // Instancia única de la clase
  static DBConnection? _instance;

  // Atributos necesarios para la conexión
  String _host;
  int _port;

  // Constructor privado para ser llamado solo desde dentro de la clase
  DBConnection._(this._host, this._port);

  // Constructor de fábrica para obtener la única instancia
  factory DBConnection(String host, int port) {
    // Si la instancia no existe, crear una nueva
    _instance ??= DBConnection._(host, port);
    return _instance!;
  }

  // Método para obtener la instancia actual
  static DBConnection get instance {
    // Si la instancia aún no ha sido creada, lanzar una excepción
    assert(_instance != null, 'DBConnection not initialized. Call the factory constructor first.');
    return _instance!;
  }

  // Otros métodos para operaciones de la base de datos
  void connect() {
    print('Connected to $_host:$_port');
  }
}

void main() {
  // Ejemplo de la clase Vehicle
  var car = Vehicle();  // Constructor por defecto
  car.displayDetails();

  var electricCar = Vehicle.fromEngine('Electrico');  // Constructor por parámetros
  electricCar.displayDetails();

  var van = Vehicle.withCapacity(8);  // Constructor por nombre
  van.displayDetails();

  var customVehicle = Vehicle.custom('SUV', 5, 'Gasolina');  // Constructor por nombre
  customVehicle.displayDetails();

  // Ejemplo de la clase DBConnection
  var dbConnection1 = DBConnection('localhost', 3306);  // Usando el constructor de fábrica
  dbConnection1.connect();

  // Intentar crear una segunda instancia debería devolver la misma instancia
  var dbConnection2 = DBConnection('google.com', 5432);
  dbConnection2.connect();

  // Usar la instancia singleton
  var currentConnection = DBConnection.instance;
  currentConnection.connect();
}