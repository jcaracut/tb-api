const toMysqlFormat = require("../includes/mySQLFormat");
const connection = require("../db/db_bunny.js");
const ImageUploader = require("../services/ImageUploaderService")

const BreedersController = {
    getFarms: (req, res) => {
        var userID = req.user.user_id;

        var selectFarms = "SELECT * FROM tbl_farm WHERE user_id=?";

        connection.query(selectFarms, [userID, 1, 1], (err, farms) => {
            if (farms.length > 0) {
                res.json({ farms: farms, success: true });
            } else {
                res.status(500).json({ message: "No farms found.", success: false });
            }
        });
    },
    uploadFarm: function (req, res) {
        ImageUploader.uploadFarm(req, res, function (err) {
            if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                console.log("Farm image successfully uploaded!");
                res.json({ success: true });
            }
        });
    },
    deleteFarm: (req, res) => {
        1
        var farm_id = req.body.farm_id;

        var deleteFarms = "UPDATE tbl_farm SET is_active=? WHERE farm_id=?;";

        connection.query(deleteFarms, [0, farm_id], (err, result) => {
            if (result.affectedRows > 0) {
                res.json({ success: true });
            } else {
                res.status(500).json({ message: "failed", success: false });
            }
        });
    },
    getRabbits: (req, res) => {
        var farm_id = req.query.farm_id;
        var user_id = req.user.user_id;

        var selectFarm = "SELECT * FROM tbl_farm WHERE user_id=? and farm_id=?";
        var selectRabbits = "SELECT * FROM tbl_rabbit WHERE farm_id=? and is_active";

        connection.query(selectFarm, [user_id, farm_id], (err, farm) => {
            if(err) console.log(err)
            if (farm.length > 0) {
                connection.query(selectRabbits, [farm_id, 1], (err, rabbits) => {
                    if (rabbits.length > 0) {
                        res.json({ rabbits: rabbits, success: true });
                    } else {
                        res.status(500).json({ message: rabbits, success: false });
                    }
                });
            } else {
                res.status(404).json({ message: "An error occured", success: false });
            }
        });
    },
    deleteRabbit: (req, res) => {
        var rabbit_id = req.body.rabbit_id;

        var deleteFarms = "UPDATE tbl_rabbit SET is_active=? WHERE rabbit_id=?;";

        connection.query(deleteFarms, [0, rabbit_id], (err, result) => {
            if (result.affectedRows > 0) {
                res.json({ success: true });
            } else {
                res.status(500).json({ message: "failed", success: false });
            }
        });
    },
    addFarm: (req, res) => {
        var userID = req.user.user_id;;
        var farmName = req.body.farmName;
        var address = req.body.address;
        var farmSize = 100;
        var image = req.body.image;
        var dateCreated = toMysqlFormat(new Date());
        var is_active = 1;
        var is_verify = 0;
        var latitude = 0;
        var longtitude = 0;

        var addFarm = "INSERT INTO `tbl_farm`(`user_id`, `farm_name`, `address`, `image`, `farm_size`, `date_created`, `is_active`, `is_verify`, `latitude`, `longitude`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        connection.query(addFarm, [userID, farmName, address, image, farmSize, dateCreated, is_active, is_verify, latitude, longtitude], (err, farms) => {
            if (err) console.log(err);

            if (farms.affectedRows > 0) {
                res.json({ message: "success", success: true });
            } else {
                res.json({ message: "An error occured", success: false });
            }
        });
    },
    addRabbit: (req, res) => {
        var farm_id = req.body.farm_id;
        var breed_type = req.body.breed_type;
        var is_available = 1;
        var quantity = req.body.quantity;
        var amount = req.body.amount;
        var dateCreated = toMysqlFormat(new Date());
        var image = req.body.image;

        var addRabbit = "INSERT INTO tbl_rabbit(farm_id, breed_type, is_available, date_created, amount, is_active, image, quantity, total_quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        connection.query(addRabbit, [farm_id, breed_type, is_available, dateCreated, amount, 1, image, quantity, quantity], (err, rabbits) => {
            if (err) res.status(500).json(err)
            if (rabbits.affectedRows > 0) {
                res.json({ rabbits: rabbits, message: "success", success: true });
            } else {
                res.status(500).json({ message: "Something went wrong.", success: false });
            }
        });
    },
    uploadRabbit: function (req, res) {
        ImageUploader.uploadRabbit(req, res, function (err) {
            if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                console.log("Rabbit image successfully uploaded!");
                res.json({ success: true });
            }
        });
    },
    getFarmExpenses: (req, res) => {
        var farm_id = req.query.farm_id;

        const selectFarmExpenses = "SELECT * FROM tbl_farm_expenses WHERE farm_id=? and is_active=?"

        connection.query(selectFarmExpenses, [farm_id, 1], (err, expenses) => {
            if (err) res.status(500).json(err)
            if (expenses.length > 0) {
                res.json({ expenses: expenses, message: "success", success: true });
            } else {
                res.status(500).json({ success: false });
            }
        });
    },
    addExpenses: (req, res) => {
        var item = req.body.item;
        var amount = req.body.amount;
        var dateAdded = toMysqlFormat(new Date());
        var farm_id = req.body.farm_id;
        var image = req.body.image
        var is_active = 1;

        const insertFarmExpenses = "INSERT INTO tbl_farm_expenses(item, amount, date_added, farm_id, image, is_active) VALUES (?, ?, ?, ?, ?, ?)"

        connection.query(insertFarmExpenses, [item, amount, dateAdded, farm_id, image, is_active], (err, expenses) => {
            if (err) res.status(500)(err)
            if (expenses.affectedRows > 0) {
                res.json({ message: "Expense has been added.", success: true });
            } else {
                res.status(500).json({ message: "Cannot add expense.", success: true })
            }
        });
    },
    deleteExpense: (req, res) => {
        var farm_expenses_id = req.body.farm_expenses_id;
        var deleteExpense = "DELETE FROM tbl_farm_expenses WHERE farm_expenses_id=?";

        connection.query(deleteExpense, [farm_expenses_id], (err, expenses) => {
            if (err) res.status(500)(err)
            if (expenses.affectedRows > 0) {
                res.json({ message: "Expense has been deleted.", success: true });
            } else {
                res.status(500).json({ message: "Cannot delete expense.", success: true })
            }
        });
    },
    updateFarm: (req, res) => {
        var farm_id = req.body.farm_id;
        var farm_name = req.body.farm_name;

        var updateFarm = "UPDATE tbl_farm SET farm_name=? WHERE farm_id=?";

        connection.query(updateFarm, [farm_name, farm_id], (err, farms) => {
            if (err) res.json(err)
            if (farms.affectedRows > 0) {
                res.json({ farms: farms, message: "success" });
            }
        });
    },
    updateFarmLocation: (req, res) => {
        var coordinates = req.body.coordinates;

        var updateFarm = "UPDATE tbl_farm SET coordinates=? WHERE farm_id=?";

        connection.query(updateFarm, [coordinates, farm_id], (err, farms) => {
            if (err) res.json(err)
            if (farms.affectedRows > 0) {
                res.json({ farms: farms, message: "success" });
            }
        });
    },
    updateRabbitInfo: (req, res) => {
        var rabbit_id = req.body.rabbit_id;
        var breed_type = req.body.breed_type;
        var amount = req.body.amount;
        var quantity = req.body.quantity;

        var updateRabbit = "UPDATE tbl_rabbit SET breed_type=?, amount=?, quantity=?, total_quantity=? WHERE rabbit_id=?";

        connection.query(updateRabbit, [breed_type, amount, quantity, quantity, rabbit_id], (err, rabbits) => {
            if (err) res.status(500).json(err)
            if (rabbits.affectedRows > 0) {
                res.json({ message: "success", success: true });
            } else {
                res.status(500).json({ message: "Cannot update rabbit.", success: true });
            }
        });
    },
    joinCycle: (req, res) => {
        if (req.user.is_verify == 1) {
            var user_id = req.user.user_id;;
            var cycle_id = req.body.cycle_id;
            var is_active = 1;
            var date_joined = toMysqlFormat(new Date());

            const insertInvestmentCycle = "INSERT INTO tbl_investment_cycle(user_id, cycle_id, is_active, date_joined) VALUES (?, ?, ?, ?)";
            const selectInvestmentCycle = "SELECT * FROM tbl_investment_cycle WHERE cycle_id=? and user_id=?";

            connection.query(selectInvestmentCycle, [cycle_id, user_id], (err, investmentCycle) => {
                if (err) res.status(500).json(err)
                if (investmentCycle.length > 0) {
                    res.status(401).json({ message: "Already joined the cycle!", success: false })
                } else {
                    connection.query(insertInvestmentCycle, [user_id, cycle_id, is_active, date_joined], (err, cycle) => {
                        if (err) res.status(500).json(err)
                        console.log(cycle)
                        if (cycle.affectedRows > 0) {
                            res.json({ success: true });
                        } else {
                            res.status(500).json({ success: false })
                        }
                    });
                }
            });
            
        } else {
            res.status(401).json({ message: "Account not verified! Please verify your account.", success: false })
        }
    },
    updateInvestmentCycle: (req, res) => {
        var investmentCycleID = req.body.investmentCycleID;
        var isActive = 0;
        const insertInvestmentCycle = "UPDATE tbl_investment_cycle SET is_active=? WHERE investment_cycle_id=?";

        connection.query(insertInvestmentCycle, [isActive, investmentCycleID], (err, breeders) => {
            if (rabbits.length > 0) {
                res.json({ rabbits: rabbits, message: "success", success: true });
            }
        });
    },
    getTransactionList: (req, res) => {
        const selectTransactionList = "SELECT "
    },
    addTransaction: (req, res) => {
        const insertTransaction = "INSERT INTO tbl_transaction(user_id, reference_id, amount, status_code, status_description, transaction_date) VALUES (?, ?, ?, ?, ?, ?)"

        connection.query(insertTransaction, (err, transac) => {
            if (transac.affectedRows > 0) {
                res.json({ success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    uploadReciept: function (req, res) {
        ImageUploader.uploadReciept(req, res, function (err) {
            if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                console.log("Reciept image successfully uploaded!");
                res.json({ success: true });
            }
        });
    },
    getFarmiInvestedMoney: function (req, res) {
        var farm_id = req.query.farm_id;
        var getFarmiInvestedMoney = "SELECT FORMAT(SUM(amount), 2) as amount FROM `tbl_rabbit` WHERE `farm_id`=? and `is_active=?"

        connection.query(getFarmiInvestedMoney, [farm_id, 0], (err, money) => {
            if (err) {
                res.json({ err: err, success: false });
            } else {
                res.json({ money: money, success: true });
            }
        });
    },
    getCurrentRabbitCycle: (req, res) => {
        var user_id = req.user.user_id;
        var date = new Date();
        var date_now = toMysqlFormat(date)
        var selectCurrentCycle = "SELECT DISTINCT(R.breed_type), DATEDIFF(C.date_to, ?) as number_of_days_left, R.*, C.* FROM tbl_cycle as C, tbl_rabbit as R, tbl_farm as F WHERE C.date_from<=R.date_created AND C.date_to>=R.date_created AND F.user_id=? AND R.farm_id=F.farm_id and C.is_active=1 ";

        connection.query(selectCurrentCycle, [date_now, user_id], (err, rabbitCycles) => {
            if (err) res.status(500).json(err)
            if (rabbitCycles.length > 0) {
                res.json({ rabbitCycles: rabbitCycles, success: true });
            } else {
                res.status(500).json({ message: "No rabbit cycles found.", success: false });
            }
        });
    },
    getCycles: (req, res) => {
        var user_id = req.user.user_id;
        var getCycles = "SELECT * FROM tbl_cycle WHERE is_active=?"
        // var getCycles = "SELECT C.* FROM tbl_cycle as C RIGHT JOIN tbl_investment_cycle as I ON C.cycle_id!=I.cycle_id and I.user_id=?"  
        connection.query(getCycles, [1], (err, cycles) => {
            if (err) res.status(500).json(err)
            console.log(cycles)
            if (cycles.length > 0) {
                res.json({ cycles: cycles, success: true });
            } else {
                res.status(404).json({ success: false, message: "No available cycles yet." });
            }
        });
    },
    getJoinedCycles: (req, res) => {
        var user_id = req.user.user_id;
        var getCycles = "SELECT C.* FROM tbl_cycle as C, tbl_investment_cycle as I WHERE C.cycle_id=I.cycle_id and I.user_id=?"
        connection.query(getCycles, [user_id], (err, cycles) => {
            if (err) res.status(500).json(err)
            if (cycles.length > 0) {
                res.json({ cycles: cycles, success: true });
            } else {
                res.status(404).json({ success: false, message: "No joined cycles found." });
            }
        });
    },
    getInvestmentRecords: function (req, res) {
        var user_id = req.user.user_id;
        var getInvestmentRecords = "SELECT A.*, F.*, CONCAT(U.first_name, ' ', U.last_name) as investor_name, C.date_to  FROM tbl_active_investment as A, tbl_farm as F, tbl_user_profile as U, tbl_cycle as C WHERE F.user_id=? and A.farm_id=F.farm_id and A.is_active=? and A.user_id=U.user_id and C.cycle_id=A.cycle_id"

        connection.query(getInvestmentRecords, [user_id, 1], (err, investments) => {
            if (err) res.status(500).json(err)
            if (investments.length > 0) {
                res.json({ recordsTotal: investments.length, data: investments, success: true });
            } else {
                res.json({ recordsTotal: investments.length, data: [], success: true });
            }
        });
    }


}

module.exports = BreedersController;