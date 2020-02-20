import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {

    function initDataBase () {

        var db = LocalStorage.openDatabaseSync("LaCuisineDB", "1.0", "Storage data for La Cuisine!", 1000000);

        db.transaction(

            function(tx) {

                // Create the database if it doesn't already exist
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_category (id INTEGER PRIMARY KEY, name TEXT, store NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_client (id INTEGER PRIMARY KEY, cnpj TEXT, social_name TEXT, niche NUMERIC, location NUMERIC, agreement TEXT, active BOOLEAN)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_hardware (id INTEGER PRIMARY KEY, name TEXT, photo TEXT, fw_name TEXT, fw_version TEXT, fw_publication TIMESTAMP, fw_md5 TEXT, fw_file TEXT)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_niche (id INTEGER PRIMARY KEY, name TEXT)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_order (id INTEGER PRIMARY KEY, device NUMERIC, store NUMERIC, date TIMESTAMP, paid BOOLEAN, status NUMERIC, dev_upd BOOLEAN, consumer_observation TEXT, store_observation TEXT)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_order_has_product (total FLOAT, order_has INTEGER PRIMARY KEY, product NUMERIC, count NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_pendency (id INTEGER PRIMARY KEY, device NUMERIC, operation NUMERIC, status NUMERIC, value NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_period (id INTEGER PRIMARY KEY, start TIME, end TIME, value NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_product (id INTEGER PRIMARY KEY, category NUMERIC, name TEXT, price FLOAT, description TEXT, image TEXT)');

                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_publicity (id INTEGER PRIMARY KEY, name TEXT, file TEXT, agreement TEXT, start_date TIME, end_date TIME, count_view NUMERIC, period NUMERIC, count_weekday NUMERIC, count_weekend NUMERIC, count_holiday NUMERIC, niche NUMERIC, cnpj TEXT, social_name TEXT)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_publicity_has_device (publicity INTEGER PRIMARY KEY, device NUMERIC, showed NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_store (id INTEGER PRIMARY KEY, client NUMERIC, cnpj TEXT, social_name TEXT, active BOOLEAN, image TEXT, menu_version TIMESTAMP)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_user (id INTEGER PRIMARY KEY, login TEXT, name TEXT, password TEXT, type NUMERIC, level NUMERIC, email TEXT, phone TEXT, cellphone TEXT)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_user_has_client (user NUMERIC, client NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_user_has_publicity (user NUMERIC, publicity NUMERIC)');
                tx.executeSql('CREATE TABLE IF NOT EXISTS tb_user_has_store (user NUMERIC, store NUMERIC)');

                tx.executeSql('DELETE FROM tb_product');
                for(var j = 1; j < 16; j++) {
                    tx.executeSql('INSERT INTO tb_product VALUES(?,?,?,?,?,?)', [j, 2, 'Terrine de Foie Gras e Palmito', 13.89, 'Um delicioso Terrine com o melhor\n Foie Gras importado, numa porção\n individual especialmente preparada\n pelo nosso Chef', '../images/ic_foto.png']);
                }
            }
        )
    }

    function getProducts () {

        var db = LocalStorage.openDatabaseSync("LaCuisineDB", "1.0", "Storage data for La Cuisine!", 1000000);

        var rs
        db.transaction(

            function(tx) {

                // Show all added greetings
                rs = tx.executeSql('SELECT * FROM tb_product');
                var r = ""
                for(var i = 0; i < rs.rows.length; i++) {
                    r += rs.rows.item(i).name + "\n"
                }
            }
        )
        return rs
    }

    Component.onCompleted: initDataBase()
}
