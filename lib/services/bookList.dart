import 'package:examen_parcial2/services/networking.dart';

// creamos una constante y en ella añadimos la api a la cual se consumira los servicios, en mi caso una de libros
const bookAPIUrl = 'http://skunkworks.ignitesol.com:8000/books/?mime_type=image%2Fjpeg';
// const bookAPIUrl = 'https://www.abibliadigital.com.br/api/books';

//creamos una clase para mostrar las diferentes categorias
class CatalogService {
  Future<dynamic> getBooks(String category) async {
    var url = '$bookAPIUrl&topic=$category';
    NetworkHelper networkHelper = NetworkHelper(url);
    var catalogData = await networkHelper.getData();
    return catalogData;
  }
   //tambien creamos una función en caso de requerir realizar alguna búsqueda(no es necesaria la implementación ya que en este proyecto no se añadio dicha funcionalidad)
  Future<dynamic> searchBooks(String category, String searchQuery) async {
    List<String> list = searchQuery.split(' ');
    searchQuery = list.join('%20');
    var url = '$bookAPIUrl&topic=$category&search=$searchQuery';
    NetworkHelper networkHelper = NetworkHelper(url);
    var catalogData = await networkHelper.getData();
    return catalogData;
  }
}
