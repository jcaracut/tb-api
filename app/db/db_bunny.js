var mysql = require('mysql');

var connection = mysql.createConnection({
	host: process.env.DB_HOST,
	user: process.env.DB_USERNAME,
	password: process.env.DB_PASSWORD,
	database: process.env.DB_NAME,
	multipleStatements: true
	// ,

	// createDatabaseTable: true,
	// // Whether or not to end the database connection when the store is closed.
	// // The default value of this option depends on whether or not a connection was passed to the constructor.
	// // If a connection object is passed to the constructor, the default value for this option is false.
	// endConnectionOnClose: true,
	// charset: 'utf8mb4_bin',
	// schema: {
	// 	tableName: 'tbl_sessions',
	// 	columnNames: {
	// 		session_id: 'session_id',
	// 		expires: 'expires',
	// 		data: 'data'
	// 	}
	// }
});

connection.connect(function (err) {
	if (err) {
		console.error('Error connecting: ' + err.stack);
		return;
	}

	console.log('Connected as id ' + connection.threadId);
});

module.exports = connection;