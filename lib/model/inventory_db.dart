import 'package:inventory_management_system/model/utils_db.dart';
import 'package:sqflite/sqflite.dart';

class Inventory {
  static const String table_name = "inventories";
  int id = 0;
  String name = "";
  String description = "";
  double quantity = 0;
  double price = 0;

  static Future<String> saveItem(Inventory inventory) async {
    String resp = "";
    Database db = await Utils.open_db();
    resp = await Inventory.init_table(db);
    if (resp.isNotEmpty) {
      return resp;
    }

    //Inserting into the database
    try {
      await db.insert(
        Inventory.table_name,
        inventory.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      resp = "";
    } catch (e) {
      resp = "Failed to save Item because ${e.toString()}";
    }

    return resp;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "quantity": quantity,
      "price": price,
      "id": id,
    };
  }

//creating of table
  static Future<String> init_table(Database db) async {
    String resp = "";
    if (db == null) {
      return resp;
    }
    String sql = "CREATE TABLE IF NOT EXISTS ${Inventory.table_name} ";
    sql +=
        "(id INTEGER PRIMARY KEY , name TEXT, description TEXT, quantity REAL,price REAL)";
    try {
      await db.execute(sql);
    } catch (e) {
      resp =
          "Failed to initialize table ${Inventory.table_name} because ${e.toString()}";
    }

    return resp;
  }

//Retreving items from the database
  static Future<List<Inventory>> get_items() async {
    Database db = await Utils.open_db();
    String resp = await Inventory.init_table(db);
    if (resp.isNotEmpty) {
      Utils.toast(resp, sucess: false);
      return [];
    }
    List<Map<String, dynamic>> maps = await db.query(
      Inventory.table_name,
      orderBy: "id Desc",
    );
    List<Inventory> inventories = [];
    for (var map in maps) {
      inventories.add(Inventory.fromJson(map));
    }
    return inventories;
  }

  // converting from json to string to be displayed method
  static Inventory fromJson(Map<String, dynamic> map) {
    Inventory inventory = Inventory();
    inventory.id = map["id"];
    inventory.name = map["name"];
    inventory.description = map["description"];
    inventory.quantity = map["quantity"];
    inventory.price = map["price"];
    return inventory;
  }

  // Deleting movie method
  static Future<String> delete_item(int id) async {
    String resp = "";
    Database db = await Utils.open_db();
    if (db == null) {
      resp = "Failed to initialize database";
      return resp;
    }
    try {
      await db.delete(Inventory.table_name, where: "id = $id");
      resp = "";
    } catch (e) {
      resp = "Failed to delete movie because ${e.toString()}";
    }
    return resp;
  }
}
