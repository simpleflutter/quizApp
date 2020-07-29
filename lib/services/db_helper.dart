import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final instance = DBHelper._();
  static Database _db;

  Future<Database> get database async {
    if (_db != null) return _db;

    _db = await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'quiz.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    //create table users
    try {
      await db.execute('create table users (name text)');
      print('table users created');
    } catch (error) {
      print('Error while creating users table $error');
    }

    //create table courses
    try {
      await db.execute(
          'create table courses (id integer primary key autoincrement, name text, descreption text)');
      print('table courses created');
    } catch (error) {
      print('Error while creating courses table $error');
    }

    //add courses
    try {
      await db.execute(
          "insert into courses values (null, 'C Language', 'Base for learning all languages')");
      await db.execute(
          "insert into courses values (null, 'C++', 'Clears your object oriented basics')");
      await db.execute(
          "insert into courses values (null, 'Java', 'Best language so far for development')");
      await db.execute(
          "insert into courses values (null, 'Data Structures', 'Manages your all program data')");
      print('Data inserted in courses table');
    } catch (error) {
      print('Error while adding courses table $error');
    }

    //create table questions
    try {
      await db.execute(
          'create table questions (id integer primary key autoincrement, question_text text, optiona text, optionb text, optionc text, optiond text, level text, answer text, course_id integer references courses(id))');
      print('tabe questions created');
    } catch (error) {
      print('Error while creating questions table $error');
    }

    //insert data in questions table
    try{

      //C Language
      await db.execute(
          'insert into questions values (null, "C Programming was created at______by Dennis Ritchie.", "Haward University", "At&T Bell Laboratory" , "Stanford Lab", "L&T Laboratary", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "All keywords in C are in _____.", "LowerCase letters", "UpperCase letters" , "CamelCase letters", "None of the mentioned", "Easy" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "The format identifier %i is also used for______ data type.", "char", "int" , "float", "double", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "what is the precedence of arithmetic operators (from highest to lowest ).", "%,*,/,+,-", "%,+,/,*,-" , " +,-,%,*,/", "%,+,-,*,/", "Easy" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "which of the following are themselves a collection of different datatypes?", "string", "structures" , "char", "all of the mentioned", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "which of the following is not possible statically in C?", "Jagged Array", "Rectangular Array" , "Cuboidal Array", "Multidimensional Array", "Easy" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "which of the following is a correct format for declaration of function?", "return-type function-name(argument type);", "return-type function-name(argument type){}" , "return-type(argument type)function-name;", "all of the mentioned", "Easy" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "Global variables are ______.", "Internal", "External" , "Both Internal and External", "None of the mentioned", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "what is the return-type of the function sqrt()?", "int ", "float" , "double", "depends on the datatype of parameter", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "what is short int in C programming?", "The basic data-type of C", "Qualifier" , "Short is the qualifier and int is the basic datatype", "None of the above", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following cannot be checked in a switch-case statement?", "Character", "Integer" , "Float", "Long", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "For 16-bit compiler allowable range for integer constants is ______?", "-3.4e38 to 3.4e38", "-32767 to 32768 " , "-32668 to 32667", "-32768 to 32767 ", "Easy" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "C was primarily developed as____________", "System programming language ", "General purpose language" , "Data processing language", "None of the above", "Easy" , " A",1)');
      await db.execute(
          ' insert into questions values (null, "Which one of the following is not a valid identifier?", "_examveda", "1examveda" , "exam_veda", "examveda1", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "Name the loop that executes at least once.", "For", "If" , "do-while", "while", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "A pointer that is pointing to NOTHING is called ____", "VOID Pointer", "DANGLING Pointer" , "NULL Pointer", "WILD Pointer", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Prototype of a function means _____", "Name of Function", "Output of Function" , "Declaration of Function", "Input of a Function", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which one is not a reserve keyword in C Language?", "auto", "main" , "case", "register", "Easy" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "Which expression has to be present in the following? exp1 ? exp2 : exp3;", "exp1", "exp2" , "exp3", "all of the mentioned", "Easy", "D",1)');
      await db.execute(
          ' insert into questions values (null, "Which keyword is used to prevent any changes in the variable?", "immutable", "mutable" , "const", "volatile", "Easy" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following cannot be a structure member?", "Another structure", "Function" , "Array", "None of the above", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "An entire array is always passed by___to a called function.", "Call by value", "Call by reference" , "Address relocation", "Address restructure", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "User-defined data type can be derived by_____", "struct", "enum" , "typedef", "all of the mentioned", "Medium" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "which of the following data type will throw an error on modulus operation(%)?", "char ", "short" , "int ", "float", "Medium" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is the correct syntax to declare a 3 dimensional array using pointers?", "char *a[][];", "char **a[];" , "char ***a;", "all of the mentioned", "Medium" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "Comment on the following C statement. Const int *ptr;", "You cannot change the value pointed by ptr", "You cannot change the pointer ptr itself" , "You May or may not change the value pointed by ptr ", "You can change the pointer as well as the value pointed by it", "Medium" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not an arithmetic operation?", "a*=10;", "a/=10;" , "a!=10;", "a%=10;", "Medium" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not a valid variable name declaration?", "int _a3;", "int a_3;" , "int 3_a;", "int _3a;", "Medium" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "What will you do to treat the constant 3.14 as a longdouble?", "use 3.14LD", "use 3.14L" , "use 3.14DL", "use 3.14LF", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "What is (void *)0?", "Representation of NULL pointer", "Representation of void pointer" , "Error", "None of the above", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "What is the difference between a declaration and a defination of a variable?", "Both can occur multiple times, but a declaration must occur first.", "A definition occurs once, but a declaration may occur many times." , "Both can occur multiple times, but a definition must occur first.", "A declaration occurs once, but a definition may occur many times.", "Medium" , "D",1)');
      await db.execute(
          ' insert into questions values (null, " Which of the following operators has the lowest precedence?", "!=", "&&" , " ?:", " ,", "Medium" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "How will you free the allocated memory?", "remove(var-name);", "free(var-name);" , "delete(var-name);", "dalloc(var-name);", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "The statement printf(“%c”, 100); will print?", " prints 100", "print garbage" , "prints ASCII equivalent of 100", "None of the above", "Medium" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "What is the right way to access value of structure variable book{ price, page }?", " printf(“%d%d”, book.price, book.page);", "printf(“%d%d”, price.book, page.book);" , " printf(“%d%d”, price::book, page::book);", " printf(“%d%d”, price->book, page->book);", "Medium" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "What is the result of logical or relational expression in C?", " True or False", "0 or 1" , " 0 if an expression is false and any positive number if an expression is true", "None of the mentioned", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "What do the following declaration signify?int *ptr[30];", "ptr is a pointer to an array of 30 integer pointers.", "ptr is a array of 30 pointers to integers." , "ptr is a array of 30 integer pointers.", "ptr is a array 30 pointers.", "Medium" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "Relational operators cannot be used on ____________", "structure", "long" , "strings", "float", "Medium" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following data type will throw an error on modulus operation(%)?", "char", "short" , "int", "float", "Medium" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "How many digits are present after the decimal in float value?", "1", "3" , "6", "16", "Medium" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "What is the similarity between a structure,union and enumeration?", "All of them let you define new values", "All of them let you define new datatypes" , "All of them let you define new pointers", "All of them let you define new structures", "Difficult" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statements correct about the below code? Maruti.engine.bolts=25;", "Structure bolts is nested within structure engine.", "Structure engine is nested within structure maruti." , "Structure maruti is nested within structure engine.", "Structure maruti is nested within structure bolts.", "Difficult" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "In C,if you pass an array as an argument to a function,what actually gets passed?", "Value of elements in array", "First element of the array" , "Base address of the array", "Address of the last element of the array", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which standard library function will you use to find the last occurance of a character in a string in C?", "strnchar()", "strchar()" , "strrchar()", "strrchr()", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "What will the function rewind() do?", "Reposition the file pointer to a character reverse.", "Reposition the file pointer stream to end of file." , "Reposition the file pointer to beginning of that line.", "Reposition the file pointer to beginning of file.", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "In which stage the following code #include<stdio.h> gets replaced by the contents of the file stdio.h", "During editing", "During linking" , "During execution", "During preprocessing", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "A range error occurs if the result of the function  cannot be represented as a value.", "int", "short int" , "double", "float", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the files cannot be opened using fopen()?", ".txt", ".bin" , ".c", "None of the mentioned", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "Within main, return expr statement is equivalent to_____", "abort(expr)", "exit(expr)" , "ferror(expr)", "None of the mentioned", "Difficult" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "Comment on the following pointer declaration. Int *ptr,p;", "ptr is a pointer to integer ,p is not", "ptr and p,both are pointers to integer " , "ptr is a pointer to integer ,p may or may not be", "ptr and p both are not pointers to integer", "Difficult" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "What do the following declaration signify? Int (*pf)();", "pf is a pointer to function.", "pf is a function pointer" , "pf is a pointer to a function which return int", "pf is a function of pointer variable.", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "If the two strings are identical, then strcmp() function returns", "-1", "1" , "0", "Yes", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "In C, if you pass an array as an argument to a function, what actually gets passed?", "Value of elements in array", "First element of the array" , "Base address of the array", "Address of the last element of array", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is the correct syntax to send an array as a parameter to function?", " func(&array);", "func(#array);" , " func(*array);", "func(array[size]);", "Difficult" , "A",1)');
      await db.execute(
          ' insert into questions values (null, "Which is the right way to declare constant in C?", "int constant var =10;", "int const var = 10;" , "const int var = 10;", "B & C Both", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "What will happen if in a C program you assign a value to an array element whose subscript exceeds the size of array?", "The element will be set to 0.", "The compiler would report an error." , "The program may crash if some important data gets overwritten.", "The array size would appropriately grow.", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "Which is the correct syntax to declare constant pointer?", "int *const constPtr;", " *int constant constPtr;" , "const int *constPtr;", "A and C both", "Difficult" , "D",1)');
      await db.execute(
          ' insert into questions values (null, "If ASCII value of x is 120,then what is the value of the H, if H=(x - w)/3;", "1", "0" , "3", "4", "Difficult" , "B",1)');
      await db.execute(
          ' insert into questions values (null, "What is the correct value to return to the operating system upon the successful completion of a program?", "1", "-1" , "0", "Program do no return a value.", "Difficult" , "C",1)');
      await db.execute(
          ' insert into questions values (null, "If P2 is Integer Pointer or Integer? typedef int *ptr; ptr p1, p2;", "Integer", "Integer pointer" , "Error in declaration", "None of the above", "Difficult" , "B",1)');

//C++
      await db.execute(
          ' insert into questions values (null, "A single line comment in C++ language source code can begin with _____", ";", ":" , "/*", "//", "Easy" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "A protected member of the class is accessible in", " Only same class", "Same class and derived class" , "Outside the class", "None of the above.", "Easy" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Designer of C++ programming language.", "Charles Babbage", "Dennis Ritchie" , "Brain Kernighan", "Bjarne Stroustrup", "Easy" , "D",2)');
      await db.execute(
          ' insert into questions values (null, " Default value of static variable is_____ .", " 0", "1" , "Garbage value", "Compiler dependent", "Easy" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "With respective to streams >> (operator) is called as", "Insertion operator", "Extraction operator" , "Right shift operator", " Left shift operator", "Easy" , "B",2)');
      await db.execute(
          ' insert into questions values (null, " How many parameters are accepted by default constructor?", "1", "2" , "3", "0", "Easy" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "A constructor is a special type of?", " class", "field" , " function", "property", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which operator can not be overloaded?", " +", " -" , " *", " ::", "Easy" , "D",2)');
      await db.execute(
          ' insert into questions values (null, " In CPP, dynamic memory allocation is done using ______________ operator.", "calloc()", "malloc()" , "allocate", "New", "Easy" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not the keyword in C++?", "volatile", "friend" , "extends", "this", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Object oriented programming employs ______ programming approach.", "Top-down", "Procedural" , "Bottom-up", "All of these", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "In CPP, cin and cout are the predefined stream ______.", "Operator", "Functions" , "Objects", "Data types", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, " _______are used for generic programming.", "Inheritance", "Virtual Functions" , "Templates", "None of these", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Classes in CPP are________ .", "derived data types", "User defined data types" , "built-in data types", "All of these", "Easy" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "_____is the OOP feature and mechanism that binds together code and the data it manipulates, and keep both safe from outside world.", "Data Binding", "Data Encapsulaton" , "Data storing", "Data Abstraction", "Easy" , "B",2)');
      await db.execute(
          ' insert into questions values (null, " ____________ refers to the act of representing only essential features without including the background details.", "Data Abstraction", "Data hiding" , "Data Encapsulation", "All of these", "Easy" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "When a class is defined inside any function or block, it is called ___________ .", "Nested class", "Local class" , "Block class", "it is not possible", "Easy" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Static variable declared in a class are also called_________ .", "Class variable", "global variable" , "named constant", "instance variable", "Easy" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following operator is called :: ?", "Conditional operator", "ternary operator" , "Scope resolution operator", "if else o/p", "Easy" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is an abstract data type?", "Class ", "int" , "String", "Double", "Easy" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following in Object Oriented Programming is supported by Function overloading and default arguments features of C++.", "Inheritance", "Polymorphism" , "Encapsulation", "All of these", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following keyword supports dynamic method resolution?", "Virtual", "Abstract" , "Dynamic", "Typeid", "Medium" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "How do we declare a abstract class?", "By providing at least one pure virtual method in a class", "By declaring at least one method abstract using the keyword abstract in a class" , "By declaring the class abstract with keyword abstract", "it is not possible to create abstract class in c++", "Medium" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is the most preferred way of throwing and handling exception?", "Throw by reference and catch by value.", "Throw by value and catch by value." , "Throw by value and catch by reference.", "Throw by reference and catch by reference", "Medium" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "When a virtual function is redefined by the derived class, it is called___________.", "Overloading", "Overriding" , "Rewriting", "All of these", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not a file opening mode ____ .", "ios::ate", " ios::nocreate" , "ios::noreplace", "ios::truncate", "Medium" , "D",2)');
      await db.execute(
          ' insert into questions values (null, " Scope resolution operator is used______ .", " to resolve the scope of global variables only", "to resolve the scope of functions of the classes only" , " to resolve scope of global variables as well as functions of the classes", "None of these", "Medium" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "What is the Difference between struct and class in terms of Access Modifier?", "By default all the struct members are private while by default class members are public.", "By default all the struct members are protected while by default class members are private." , "By default all the struct members are public while by default class members are private.", "By default all the struct members are public while by default class members are protected.", "Medium" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "How do we define a destructor?", "X~() {}", "X() {}~" , "X() ~{}", "~X() {}", "Medium" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "Inline functions are invoked at the time of", "Run time", "Compile time" , "Depends on how it is invoked", "Both b and c above", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statement is correct if a class inherits another class publically?", "Public members of the base class will be private members of derived class.", "Public members of the base class will be protected members of derived class." , "Public members of the base class will be public members of derived class.", "Private members of the base class will be protected members of derived class.", "Medium" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statements is correct?", "Base class pointer cannot point to derived class.", "Derived class pointer cannot point to base class." , "Pointer to derived class cannot be created.", "Pointer to base class cannot be created.", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Header file used to perform both read & write operations on files in C++?", "<ofstream>", "<ifstream>" , " <fstream>", "<iostream>", "Medium" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Runtime polymorphism is done using.", "Function overloading", "Virtual classes" , "Virtual Function", "Friend function", "Medium" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not recommended in a header files?", "Type definitions(typedefs)", "Template definitions" , "function definitions", "class definitions", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not a component of file system?", "Free integrity mechanism", "Access method" , "Auxillary storage management", "None of the above", "Medium" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "The copy constructor is executed on", "Assigned one object to another object at its creation", "When objects are snet to function using call by value mechanism" , "When the function return an object", "All of the above", "Medium" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "What is lambda expression in C++?", "A technique of C++ that allows us to write inline functions without a name", "A technique of C++ that allows us to write overloaded functions" , "A technique of C++ that allows us to write functions that are called more than once", " A technique of C++ that allows us to write functions without parameters", "Medium" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is used to create an output stream?", "<ifstream>", "<ofstream>" , "<fstream>", "<iostream>", "Medium" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following advantages we lose by using multiple inheritances?", "Dynamic binding", " Polymorphism" , " Constructor", " Both Dynamic binding & Polymorphism", "Medium" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "How can we restrict dynamic allocation of objects of a class using new?", "By overloading new operator", "By making an empty private new operator.  " , "By making empty private new and new[] operator.", "By overloading new and new[] operator.", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "In how many ways we can capture the external variables in the lambda expression?", "1", "2" , "3", "4", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Why do we need to handle exceptions?", "To avoid unexpected behaviour of a program during run-time", "To let compiler remove all exceptions by itself" , "To successfully compile the program", "To get correct output", "Difficult" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "What is Re-throwing an exception means in C++?", "An exception that is thrown again as it is not handled by that catching block", "An exception that is caught twice" , "An exception that is not handled in one caught hence thrown again", "All of the mentioned", "Difficult" , "D",2)');
      await db.execute(
          ' insert into questions values (null, " Which of the following operator can be overloaded?", "?:", "::" , ".", "==", "Difficult" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "What we can’t place followed by the non-default arguments?", "trailing arguments", "default arguments" , "both trailing & default arguments", "leading arguments", "Difficult" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Which one of the following is not a possible state for a pointer?", "hold the address of the specific object", "zero" , "point to a type", " point one past the end of an object", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "What will we not do with function pointers?", "allocation of memory", "deallocation of memory" , "both allocation & deallocation of memory", "finds memory status", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "What is the mandatory part to present in function pointers?", "&", "return values" , "*", "data types", "Difficult" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "Identify the correct statement about throw(type).", "A function can throw any type of exceptions", "A function can throw an exception of certain type only" , "A function can’t throw any type of exception", "A function can catch all types of exceptions", "Difficult" , "D",2)');
      await db.execute(
          ' insert into questions values (null, " In case of inheritance where both base and derived class are having constructors, when an object of derived class is created then___________ .", "constructor of derived class will be invoked first", " constructor of base class will be invoked first" , " constructor of derived class will be executed first followed by base class", " constructor of base class will be executed first followed by derived class", "Difficult" , "D",2)');
      await db.execute(
          ' insert into questions values (null, "What is the size of empty class?", "0", "1" , "2", "4", "Difficult" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "If I want to use multiple modes in open() function while file handling then which operator is used for this?", " ios::out | ios::in", " ios::out, ios::in" , " ios::out || ios::in", "ios::out & ios::in", "Difficult" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "In inheritance, order of execution of base class and derived class destructors are", "Base to derived", "Derived to base" , "Random order", "none", "Difficult" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "Run time binding is related to", "Function overriding", "Operator overloading" , "A & B", "None", "Difficult" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "Why seekg() is used in file handling of C++", "Moves get pointer (input) to a specified location", "Moves put pointer (output) to a specified location" , "Gives the current position of the get pointer", "Gives the current position of the put pointer", "Difficult" , "A",2)');
      await db.execute(
          ' insert into questions values (null, "What is the difference between overloaded functions and overridden functions?", "Overloading is a dynamic or run-time binding and Overriding is static or compile-time binding", "Redefining a function in a friend class is called function overriding while Redefining a function in a derived class is called a overloaded fucntion" , "Overloading is a static or compile-time binding and Overriding is dynamic or run-time binding", "Redefining a function in a friend class is called function overloading while Redefining a function in a derived class is called as overridden fucnion.", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statement is not correct about References in C++ ?", "Reference must be initialized when it is created.", "Once initialized, we cannot reinitialize a reference." , "We can have a NULL reference.", "Reference is automatically dereferenced.", "Difficult" , "C",2)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statement is correct regarding destructor of base class?", "Destructor of base class should always be static.", "Destructor of base class should always be virtual" , "Destructor of base class should not be virtual.", "Destructor of base class should always be private.", "Difficult" , "B",2)');
      await db.execute(
          ' insert into questions values (null, "If a function is friend of a class, which one of the following is wrong?", " A function can only be declared a friend by a class itself.", "Friend functions are not members of a class, they are associated with it." , "Friend functions are members of a class.", " It can have access to all members of the class, even private ones.", "Difficult" , "C",2)');

//Java
      await db.execute(
          ' insert into questions values (null, "   Which of the following automatic type conversion will be possible?", "short to int", "byte to int" , "int to long", "long to int", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "In Java, the word true is ................", "A java keyword", "A boolean literal" , " Same as value 1", "Same as value 0", "Easy" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "Select from among the following character escape code which is not available in Java.", "\t", "\r" , "\a", "\\", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "The String method compareTo() returns", "TRUE", "FALSE" , "an int  value", "1", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "The class string belongs to ................. package.", "java.awt", "java.lang" , " java.applet", " java.string", "Easy" , "B",3)');
      await db.execute(
          ' insert into questions values (null, " Which statement is true regarding an object?", "An object is what classes instantiated are from", "An object is an instance of a class" , "An object is a variable", "An object is a reference to an attribute", "Easy" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "The wrapping up of data and functions into single unit is called", "Encapsulation", "Data Hiding" , "Abstraction", "Message passing", "Easy" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:", "Encapsulation ", "Interface                                                                                     " , "Composition", "Inheritance                                                                                    ", "Easy" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Basic Java language functions are stored in which of the following java package?", "java.lang", "java.io                                                                                                    " , "java.net                                                                                                ", "java.util                                                                                                                                    ", "Easy" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "The fields in an interface are implicitly specified as,", "static only ", "protected " , "private", "both static and final ", "Easy" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "URL stands for", "Universal reader locator", "Universal reform loader" , "Uniform resource loader", "Uniform resource locator", "Easy" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "To prevent any method from overriding, we declare the method as,", "static", "const " , "final ", "abstract ", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not true?", "An interface can extend another interface.", "A class which is implementing an interface must implement all the methods of the interface." , "An interface can implement another interface", "An interface is a solution for multiple inheritance in java", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following variable declaration would NOT compile in a java program?", "int var;                                                                        ", "int VAR;                                                                                         " , "int 1_var;.", "int var_1;                                                                                     ", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "A constructor", "Must have the same name as the class it is declared within", "Is used to create objects" , "May be declared private", " (a), (b) and (c) above", "Easy" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "The java run time system automatically calls this method while garbage collection.", "finalizer()", "finalize()" , "finally()", "finalized()", "Easy" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following options would legally declare, construct, and initialize an array?", ". int [] myList = {“1″, “2″, “3″};", "int myList [] = {4, 3, 7};" , "int [] myList = (5, 8, 2);", "int myList [] [] = {4,9,7,0};", "Easy" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "What would happen if “String[]args” is not included as an argument in the main method", "No error", "Compilation error" , "The program won’t run", "Program exit", "Easy" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "A package is a collection of", "classes", "interfaces" , "editing tools", "classes and interfaces", "Easy" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Using which keyword we can access the value of the     instance variables and class variables of that class inside     the method of that class itself.", "super", "final" , "this", "either super or this", "Easy" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Java support RMI. What does this RMI stand for?", "Random Memory Interface", "Remote Method Invocation" , "Random Method Invocation", "Remote Memory Interface", "Medium" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "Java is designed for ………. environment of the Internet", "Development", "Deduction" , "Distributed", "Web Design", "Medium" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following denotes a Javadoc comment?", "//#", "/*" , "/**", "//**", "Medium" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Java Virtual Machine is platform independent", "TRUE", "FALSE" , "Not at all", "May be", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which is a superclass of all exception classes?", "Throwable", "Exception" , "RuntimeException", "IOException", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which of those does not have an index based structure?", "List", "Set" , "Map", "None of these", "Medium" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "The wrapping up of data and functions into a single unit is called", "Encapsulation ", "Abstraction" , "Data Hiding ", "Polymorphism", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:", "Encapsulation", "Interface" , "Composition", "Inheritance", "Medium" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which of these is NOT a valid keyword or reserved word in Java ?", "default", "null" , "String", "volatile", "Medium" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which declaration of the main() method is valid ?", "public void main( String args [] )", "public void static main( String args [])" , "final public static void main(String[] arr)", "public static void main( String[] arr)", "Medium" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Is 3 * 4 equivalent to 3 << 2 ?", "Yes", "No" , "May be", "None of these", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which operator will always evaluate all the Operands?", "||", "&&" , "?:", "%", "Medium" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which option among the following creates an instance of an array?", "int[ ] ia = new int[15];", "int ia[ ] [ ] = { 4, 5, 6 }, { 1,2,3 };" , "char[ ] ca = “Some String”;", "float fa = new float[20];", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is a type of polymorphism in Java?", "Compile time polymorphism", "Execution time polymorphism" , "Multiple polymorphism", "Multilevel polymorphism", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following does not belong: If a class inherits from some other class, it should", "Make use of the parent class’s capabilities", "Over-ride or add the minimum to accomplish the derived class’ purpose" , "Over-ride all the methods of its parent class", "Make sure the result “IS-A-KIND-OF” its base class", "Medium" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Given a class named student, which of the following is a valid constructor declaration for the class?", "Student (student s) { }                                                                                              ", "Student student ( ) { }" , "Private final student ( ) { }                                                                                            ", "Void student ( ) { }", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "In Java, declaring a class abstract is useful", "To prevent developers from further extending the class", "When it doesn’t make sense to have objects of that class" , "When default implementations of some methods are not desirable", "To force developers to extend the class not to use its capabilities", "Medium" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following has a method names flush( )?", "Input stream ", "Output Stream" , "Reader stream ", "Input reader stream", "Medium" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "File class is included in which package?", "java.io package", "java.lang package" , "java.awt package", "java.util.package", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "The default value of a static integer variable of a class in Java is", "0", "1" , "Garbage value ", "Null", "Medium" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "What is byte code in the context of Java?", "The type of code generated by a Java compiler", "The type of code generated by a Java Virtual Machine" , "It is another name for a Java source file", "It is the code written within the instance methods of a class", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "All exception types are subclasses of the built-in class", "Exception ", "RuntimeException   " , "Error", "Throwable ", "Difficult" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "In java, objects are passed as", "Copy of that object", "Method called call  by value" , "Memory address", "Constructor", "Difficult" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statements about Java Threads is correct?", "Java threads don’t allow parts of a program to be executed in parallel", "Java is a single-threaded language" , "Java’s garbage collector runs as a high priority thread", "Every java application is not multithreaded.", "Difficult" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which one of the following is not true?", "A class containing abstract methods is called an abstract class", "Abstract methods should be implemented in the derived class" , "An abstract class cannot have non-abstract methods", "A class must be qualified as ‘abstract’ class, if it contains one abstract method", "Difficult" , "C",3)');
      await db.execute(
          ' insert into questions values (null, "In Java, a character constant’s value is its integer value in the ………………………character set.", "EBCDIC ", "Unicode" , "ASCII ", "Binary", "Difficult" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "An applet cannot be viewed using", "Netscape navigator", "Microsoft Internet Explorer" , "Sun’ Hot Java Browser", "Applet viewer tool which comes, with the Java Development Kit", "Difficult" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which of these is correct about passing an argument by call-by-value process?", "Copy of argument is made into the formal parameter of the subroutine", "Reference to original argument is passed to formal parameter of the subroutine" , "Copy of argument is made into the formal parameter of the subroutine and changes made on parameters of subroutine have effect on original argument", "Reference to original argument is passed to formal parameter of the subroutine and changes made on parameters of subroutine have effect on original argument.", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "What is used to execute parameterized query?", "Statement interface", "PreparedStatement interface" , "ResultSet interface", "None of the above", "Difficult" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "Which class can handle any type of request so that it is protocol-independent?", "GenericServlet", "HttpServlet" , "Both A & B", "None of the above", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which method of string class in java is used to convert the boolean into String?", " public static String valueOf(double I)", "public static String valueOf(boolean I)" , "public boolean equals(Object anObject)", "public static String valueOf(Object obj)", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which Exception occurs when a class is not found while dynamically loading a class using the class loaders?", "ClassNotFoundException", "ClassFoundException" , "NoClassDefFoundError", "ClassDefFoundError", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which variables are created when an object is created with the use of the keyword new and destroyed when the object is destroyed?", "Local variables", "Instance variables" , "Class Variables", "Static variables", "Difficult" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "What is it called where child object gets killed if parent object is killed?", "Aggregation", "Composition" , "Encapsulation", "Association", "Difficult" , "B",3)');
      await db.execute(
          ' insert into questions values (null, "What is it called where object has its own lifecycle and child object cannot belong to another parent object?", "Aggregation", "Composition" , "Encapsulation", " Association", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which keyword is used by the method to refer to the object that invoked it?", "import", "catch" , "abstract", "this", "Difficult" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which operator is used by Java run time implementations to free the memory of an object when it is no longer needed?", "delete", "free" , "new", "none of the mentioned", "Difficult" , "D",3)');
      await db.execute(
          ' insert into questions values (null, "Which of these is correct way of inheriting class A by class B?", "class B + class A {}", "class B inherits class A {}" , "class B extends A {}", "class B extends class A {}", "Difficult" , "C",3)');
      await db.execute(
          ' insert into questions values (null, " Which of these methods of class StringBuffer is used to extract a substring from a String object?", "substring()", "Substring()" , "SubString()", "None of the mentioned", "Difficult" , "A",3)');
      await db.execute(
          ' insert into questions values (null, "Which of these is a super class of wrappers Long, Character & Integer?", "Long", "Digits" , "Float", "Number", "Difficult" , "D",3)');

      //DS
      await db.execute(
          ' insert into questions values (null, " Which of the following uses FIFO method?", "Queue", "Stack" , "Hash Table", "BinarySearch Tree", "Easy" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following points is/are true about Linked List data structure when it is compared with array?", "Arrays have better cache locality that can make them better in terms of performance.", "It is easy to insert and delete elements in Linked List" , "Random access is not allowed in a typical implementation of Linked Lists", "All of the above", "Easy" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following sorting algorithms can be used to sort a random linked list with minimum time complexity?", "Insertion Sort", "Quick Sort" , "Heap Sort", "Merge Sort", "Easy" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which one of the following is an application of Stack Data Structure?", "Managing function calls", "The stock span problem" , "Arithmetic expression evaluation", "All of the above", "Easy" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "To evaluate an expression without any embedded function calls:", "One stack is enough", "Two stacks are needed" , "As many stacks as the height of the expression tree are needed", "A Turing machine is needed in the general case", "Easy" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "How many stacks are needed to implement a queue. Consider the situation where no other data structure like arrays, linked list is available to you.", "1", "2" , "3", "4", "Easy" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "How many queues are needed to implement a stack. Consider the situation where no other data structure like arrays, linked list is available to you.", "1", "2" , "3", "4", "Easy" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "A program P reads in 500 integers in the range [0..100] exepresenting the scores of 500 students. It then prints the frequency of each score above 50. What would be the best way for P to store the frequencies?", "An array of 50 numbers", "An array of 100 numbers" , "An array of 500 numbers", "A dynamically allocated array of 550 numbers", "Easy" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following operations is not O(1) for an array of sorted data. You may assume that array elements are distinct.", "Find the ith largest element", "Delete an element" , "Find the ith smallest element", "All of the above", "Easy" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following correctly declares an array?", "int geeks[20];", "int geeks;" , "geeks{20};", "array geeks[20]; ", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Consider a two dimensional array A[20][10]. Assume 4 words per memory cell, the base address of array A is 100, elements are stored in row-major order and first element is A[0][0]. What is the address of A[11][5] ? ", "560", "450" , "520", "500", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "How many undirected graphs (not necessarily connected) can be constructed out of a given set V= {V 1, V 2,…V n} of n vertices ? ", "n(n-l)/2 ", "n! " , "2^n ", "2^(n(n-1)/2) ", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statements is/are TRUE for an undirected graph? P: Number of odd degree vertices is even Q: Sum of degrees of all vertices is even", "P Only", "Q Only" , "Both P and Q", "Neither P nor Q", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "Consider an undirected random graph of eight vertices. The probability that there is an edge between a pair of vertices is 1/2. What is the expected number of unordered cycles of length three?", "1/8", "1" , "7", "8", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "Given an undirected graph G with V vertices and E edges, the sum of the degrees of all vertices is", "E", "2E" , "V", "2V", "Medium" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "How many undirected graphs (not necessarily connected) can be constructed out of a given set V = {v1, v2, ... vn} of n vertices?", "n(n-1)/2", "2n" , "n!", "2n(n-1)/2", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Consider a B+-tree in which the maximum number of keys in a node is 5. What is the minimum number of keys in any non-root node?", "1", "2" , "3", "4", "Medium" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following statement is incorrect with respect to balancing symbols algorithm?", "{[()]}", "([ )] " , "{( )}", "{ [ ] }", "Difficult" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "How many passes does the balancing symbols algorithm makes through the input?", "One stack is enough", "Two stacks are needed" , "three", "four", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "What should be added in place of /*ADD A STATEMENT HERE*/, so that the function correctly reverses a linked list.", "*head_ref = prev;", "*head_ref = current;" , "*head_ref = next;", "*head_ref = NULL;", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "What should be done when an opening parentheses is read in a balancing symbols algorithm?", "push it on to the stack", "throw an error" , "ignore the parentheses", "pop the stack", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "The smallest element of an arrays index is called its", "lower bound", "upper bound" , "extraction", "node", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Consider a node X in a Binary Tree. Given that X has two children, let Y be Inorder successor of X. Which of the following is true about Y?", "Y has no right child", "Y has no left child" , "Y has both children", "None of the above", "Difficult" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "In ........, search start at the beginning of the list and check every element in the list.", ". Binary search", "Hash Search" , ". Linear search", "Binary Tree ", "Easy" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "In the ....... traversal we process all of a vertex’s descendants before we move to an adjacent vertex.", "Depth Limited", "With First" , "Breadth First", "Depth First", "Easy" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "A graph is a collection of nodes, called...... And line segments called arcs or ...... that connect pair of nodes.", ". vertices, paths", "edges, vertices" , ". vertices, edges", "graph node, edges", "Easy" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "To represent hierarchical relationship between elements, which data structure is suitable?", "Graph", "Tree" , "Dequeue", "priority", "Easy" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Herder node is used as sentinel in........", "Queues", ". Stacks" , "Graphs", "Binary tree", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which if the following is/are the levels of implementation of data structure", "Application level", " Abstract level" , " Implementation level", "All of the above", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which one of the following permutations can be obtained the output using stack assuming that the input is the sequence 1,2,3,4,5 in that order ?", "3,4,5,2,1 ", " 3,4,5,1,2" , "5,4,3,1,2", "1,5,2,3,4", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "A binary search tree whose left subtree and right subtree differ in hight by at most 1 unit is called ……", "AVL tree", "Red-black tree" , " Lemma tree", "None of the above", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "The initial configuration of the queue is a,b,c,d (a is the front end). To get the configuration d,c,b,a one needs a minimum of ?", "3 additions and 2 deletions", "2 deletions and 3 additions" , " 3 deletions and 4 additions", "3 deletions and 3 additions", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "_______ level is where the model becomes compatible executable code", "Abstract level", "Implementation level" , "Application level", "All of the above", "Medium" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Linked list are not suitable data structure of which one of the following problems ?", "Binary search", " Insertion sort" , "Radix sort", " Polynomial manipulation", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "The number of possible ordered trees with three nodes A,B,C is?", "16", "12" , "6", "10", "Medium" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following algorithm design technique is used in the quick sort algorithm?", " Dynamic programming", "Greedy method" , "Divide and conquer", "Backtracking", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "_____ is not the component of data structure.", "Operations", "Algorithms" , "Storage Structures", " None of above", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "The number of swapping needed to sort numbers 8,22,7,9,31,19,5,13 in ascending order using bubble sort is ?", "11", "12" , "13", "14", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is not the part of ADT description?", " Data", " Operations" , "Both of the above", "None of the above", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Inserting an item into the stack when stack is not full is called _______ Operation and deletion of item form the stack, when stack is not empty is called _____operation.", "push, pop", "insert, delete" , " pop, push", " delete, insert", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "______ is very useful in situation when data have to stored and then retrieved in reverse order.", "Stack", "Queue" , " List", " Link list", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "…………. Is a pile in which items are added at one end and removed from the other.", "Queue", "Stack" , "List", "None of the above", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Which data structure allows deleting data elements from and inserting at rear?", " Stacks", "Dequeues" , "Queues", "Binary search tree", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "Given two sorted lists of size m and n respectively.The number of comparisons needed in the worst case by the merge sort algorithm will be?", "mn", "max(m,n) " , "min(m,n)", " m+n-1", "Medium" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following data structure cannot store the non-homogeneous data elements?", "Arrays", "Records " , " Pointers", " Stacks", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "A ______ is a data structure that organizes data similar to a line in the supermarket, where the first one in line is the first one out.", "Stacks linked list", "Queue linked list" , "Both of them", " Neither of them", "Medium" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Merge sort uses ?", "Divide and conquer strategy", "Backtracking approach" , "Heuristic search", " Greedy approach", "Medium" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "The extra key inserted at the end of the array is called a,", "end key", "stop key" , "sentinal", "transportation", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "The largest element of an array index is called its", "lower bound ", "upper bound" , "range", "All of the above", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "Each array declaration need not give, implicitly or explicitly, the information about", "name of array", "datatype of array" , "the first data from set to be stored", "the index set of array", "Medium" , "C",4)');
      await db.execute(
          ' insert into questions values (null, "Arrays are best data structures", "for relatively permanent collection of data", "for the size of the structure and the data in the structure are constantly changing " , "for both of above situation", "for nomne of above situation", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Two dimensional arrays are also called", "table arrays ", "matrix arrays" , "Both of the above", "None of the above", "Difficult" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Fibonacci sequence is the sequence of integers", "1,3,5,7,9,11,13", "0, 1, 1,2,3,5,8, 13,21,54 ...." , "0, 1, 3, 4, 7, 11, 18, 29, 47 ...", "0, 1, 3, 7, 15 ...", "Difficult" , "B",4)');
      await db.execute(
          ' insert into questions values (null, "Array is divided into two parts in ____________", "sparse array", "hash array tree" , "geometric array", "Bounded size dynamic array", "Easy" , "D",4)');
      await db.execute(
          ' insert into questions values (null, "Which of the following is a disadvantage of dynamic arrays?", "memory Leak", "Locality of refernce" , "Data cache utilization", "Random Acces", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "Which application of stack is used to ensure that the pair of parentheses is properly nested?", "Balancing symbols", "Reversing a stack" , "Conversion of an infix to postfix expression", "Conversion of an infix to prefix expression", "Difficult" , "A",4)');
      await db.execute(
          ' insert into questions values (null, "In balancing parentheses algorithm, the string is read from?", "right to left", "left to right" , "center to right", "center to left", "Difficult" , "B",4)');

  print('Data inserted to Questions table');

    }catch(error){
  print('error while adding data to quiz table');
    }

    //create table quiz
    try {
      await db.execute(
          'create table quiz (id integer primary key autoincrement, course_id integer references courses(id), quiz_time text, quiz_date text, level text,  questions text,   answers text, total_questions integer,	answered integer, unanswered integer, correct	integer, wrong integer,	score integer)');
      print('tabe quiz created');
    } catch (error) {
      print('Error while creating quiz table $error');
    }
  }  

}
