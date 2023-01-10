import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:examen_parcial2/Constants.dart';
import 'package:examen_parcial2/model/books.dart';
import 'package:examen_parcial2/screens/home.dart';
import 'package:examen_parcial2/services/bookList.dart';
import 'package:examen_parcial2/widgets/bookCard.dart';
import 'package:url_launcher/url_launcher.dart';

class Books extends StatefulWidget {
  final category;

  const Books({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  CatalogService catalogService = CatalogService();
  List<Results> results = [];
  String query = '';
  TextEditingController controller = TextEditingController();

  void searchBooks() async {
    var bookData =
        await catalogService.getBooks(widget.category.toString().toLowerCase());
    BooksModel booksFetched = BooksModel.fromJson(bookData);
    setState(() {
      results = booksFetched.results;
    });
  }

  void searchQuery(String query) async {
    var bookData = await catalogService.searchBooks(
        widget.category.toString().toLowerCase(), query);
    BooksModel booksFetched = BooksModel.fromJson(bookData);
    setState(() {
      if (results.isEmpty) results = booksFetched.results;
    });
  }

 BuildContext scaffoldContext;

  @override
  void initState() {
    super.initState();
    searchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          textTheme: Theme.of(context).textTheme,
          //toolbarHeight: 175.0,
          
          elevation: 0.0,
          bottom: PreferredSize(
            // ignore: sort_child_properties_last
            child: Column(
              children: [
                
                ListTile(
                  leading: InkWell(
                    child: SvgPicture.asset('assets/images/Back.svg'),
                    onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyMainPage())),
                  ),
                 
           title: Text(
                    widget.category,
                    style: kHeadingTwo,
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Búsqueda rápida',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA0A0A0),
                      ),
                      border: const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF0F0F6),
                      focusColor: const Color(0xFFF0F0F6),
                      prefixIcon: SvgPicture.asset(
                        'assets/images/Search.svg',
                        fit: BoxFit.none,
                      ),
                      suffixIcon: query.isNotEmpty
                          ? InkWell(
                              child: SvgPicture.asset(
                                'assets/images/Cancel.svg',
                                fit: BoxFit.none,
                              ),
                              onTap: () {
                                controller.clear();
                                searchBooks();
                              },
                            )
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        results.clear();
                        setState(() {
                          query = '';
                        });
                        query = value;
                      });
                      query.isEmpty ? searchBooks() : searchQuery(query);
                    },
                    onSubmitted: (value) {
                      setState(() {
                        results.clear();
                        query = value;
                      });
                      query.isEmpty ? searchBooks() : searchQuery(query);
                    },
                  ),
                ),*/
              ],
            ),
            
            preferredSize: const Size.fromHeight(5),
          ),
        ),
        // ignore: unnecessary_new
        body: new Builder(builder: (BuildContext context) {
          scaffoldContext = context;
          return results.isNotEmpty
              ? GridView.builder(
                  itemCount: results.length,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (114 / (162 + 75)),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: BookCard(
                       title: results[index].title,
                        author: results[index].authors.isNotEmpty
                            ? results[index].authors[0].name
                            : '',
                        imgURL: results[index].formats.imageJpeg,
                      ),
                      onTap: () {
                       Formats formats = results[index].formats;
                        //showBook(formats);
                        detailBooks(formats);
                      },
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }));
  }

  void showBook(Formats formats) {
    if (formats.textHtml != null)
      launch(formats.textHtml);
    else if (formats.textHtmlCharsetIso88591 != null)
      launch(formats.textHtmlCharsetIso88591);
    else if (formats.textHtmlCharsetUsAscii != null)
      launch(formats.textHtmlCharsetUsAscii);
    else if (formats.textHtmlCharsetUtf8 != null)
      launch(formats.textHtmlCharsetUtf8);
    else if (formats.applicationPdf != null)
      launch(formats.applicationPdf);
    else if (formats.textPlain != null)
      launch(formats.textPlain);
    else if (formats.textPlainCharsetIso88591 != null)
      launch(formats.textPlainCharsetIso88591);
    else if (formats.textPlainCharsetUsAscii != null)
      launch(formats.textPlainCharsetUsAscii);
     
  
  }
  
  
  
  detailBooks(Formats formats) {
return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
            
              margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
           //obtenenmos los datos del email
           Text('From: ${formats.textHtml != null}', style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10),
            Container(
              //añadir un espacio entre los lados del texto
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              /*child: Text('Subject: ${email.subject}')),
               Text('Body: ${email.body}'),
               const SizedBox(height: 10),
              Text('Date: ${email.dateTime}', style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10),*/
            )
          ],
        ),
      ),
    );


  }
 
  }
