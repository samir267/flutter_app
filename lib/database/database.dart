import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  // Convertir l'objet User en Map pour l'insérer dans la base de données
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}

// Classe pour gérer la base de données
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  // Initialiser la base de données
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  // Insérer un nouvel utilisateur
  Future<void> addUser(User user) async {
    final db = await instance.database;

    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Récupérer tous les utilisateurs
  Future<List<User>> fetchUsers() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

Future<User?> getUserByEmailAndPassword(String email, String password) async {
  final db = await instance.database;

  // Requête SQL pour trouver un utilisateur avec l'email et le mot de passe fournis
  final List<Map<String, dynamic>> maps = await db.query(
    'user',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );

  // Si un utilisateur est trouvé, retourne un objet User
  if (maps.isNotEmpty) {
    return User(
      id: maps[0]['id'],
      name: maps[0]['name'],
      email: maps[0]['email'],
      password: maps[0]['password'],
    );
  } else {
    return null; // Retourne null si aucun utilisateur n'est trouvé
  }
}
  // Fermer la base de données
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

// Ajouter cette méthode dans la classe DatabaseHelper
