var toMysqlFormat = require("../includes/mySQLFormat");
var connection = require("../db/db_bunny.js");

var AdminsController = {
    getAllUsers: (req, res) => {
        var selectAllUser = "SELECT * FROM tbl_user_profile;";

        connection.query(selectAllUser, (err, users) => {
            if (users.length > 0) {
                res.json({ users: users });
            }
        });
    },
    getAllInvestors: (req, res) => {
        var selectAllInvestors = "SELECT * FROM tbl_user_profile As P, tbl_user AS U WHERE U.user_type=1 and U.user_id=P.user_id";
        connection.query(selectAllInvestors, [1], (err, investors) => {
            if (err) res.status(500).json(err)
            if (investors.length > 0) {
                res.json({ investors: investors, success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    getAllBreeders: (req, res) => {
        var selectAllIBreeders = "SELECT * FROM tbl_user_profile As P, tbl_user AS U WHERE U.user_type=2 and U.user_id=P.user_id";

        connection.query(selectAllIBreeders, [2], (err, breeders) => {
            if (err) res.status(500).json(err)
            if (breeders.length > 0) {
                res.json({ breeders: breeders, success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    getFarmBreeder: (req, res) => {
        var farm_id = req.query.farm_id;
        var selectBreeders = "SELECT U.first_name, U.last_name FROM tbl_user_profile as U, tbl_farm as F WHERE F.farm_id=? and U.user_id=F.user_id";

        connection.query(selectBreeders, [farm_id], (err, breeders) => {
            if (err) res.status(500).json(err)
            if (breeders.length > 0) {
                res.json({ breeder: breeders[0], success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    verifyUser: (req, res) => {
        var user_id = req.body.user_id;
        var activateUser = "UPDATE tbl_user SET is_verify=1 WHERE user_id=?;";

        connection.query(activateUser, [user_id], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.affectedRows === 1) {
                res.json({ success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    verifyFarm: (req, res) => {
        var farm_id = req.body.farm_id;
        var latitude = req.body.latitude;
        var longitude = req.body.longitude;

        var activateUser = "UPDATE tbl_farm SET is_verify=?, latitude=?, longitude=? WHERE farm_id=?;";

        connection.query(activateUser, [1, latitude, longitude, farm_id], (err, farm) => {
            if (err) res.status(500).json(err)
            if (farm.affectedRows === 1) {
                res.json({ success: true });
            } else {
                res.status(500).json({ success: false });
            }
        });
    },
    activateUser: (req, res) => {
        var user_id = req.body.user_id;
        var deleteUser = "UPDATE tbl_user SET is_active=1 WHERE user_id=?;";

        connection.query(deleteUser, [user_id], (err, users) => {
            if (users.affectedRows === 1) {
                res.json({ message: "Success", success: true });
            }
        });
    },
    deactivateUser: (req, res) => {
        var user_id = req.body.user_id;
        var deleteUser = "UPDATE tbl_user SET is_active=0 WHERE user_id=?;";

        connection.query(deleteUser, [user_id], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.affectedRows === 1) {
                res.json({ message: "User has been deactivated.", success: true });
            } else {
                res.status(500).json({ message: "Cannot deactivate user.", success: false });
            }
        });
    },
    banUser: (req, res) => {
        var user_id = req.body.user_id;
        var cause = req.body.cause;
        console.log(req.body)
        var deleteUser = "UPDATE tbl_user SET is_banned=1 WHERE user_id=?;";

        connection.query(deleteUser, [user_id], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.affectedRows === 1) {
                res.json({ message: "User has been banned. Cause: " + cause, success: true });
            } else {
                res.status(500).json({ message: "Cannot banned user.", success: false });
            }
        });
    },
    deleteUser: (req, res) => {
        var user_id = req.body.user_id;
        var deleteUser = "DELETE FROM tbl_user WHERE user_id=?;";

        connection.query(deleteUser, [user_id], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.affectedRows === 1) {
                res.json({ message: "Success", success: true });
            } else {
                res.status(500).json({ message: "Cannot user delete user.", success: false });
            }
        });
    },
    getAllFarms: (req, res) => {
        var selectAllUser = "SELECT * FROM tbl_farm;";

        connection.query(selectAllUser, (err, farms) => {
            if (err) res.status(500).json(err)
            if (farms.length > 0) {
                res.json({ farms: farms });
            } else {
                res.status(500).json({ message: "No farms found!", success: false });
            }
        });
    },
    getAllUnverifiedUsers: (req, res) => {
        var selectAllUnverifiedUser = "SELECT * FROM tbl_user as U, tbl_user_profile as UP WHERE U.user_type!=? and U.is_verify=? and U.is_active=? and U.user_id=UP.user_id;";

        connection.query(selectAllUnverifiedUser, [0, 0, 1], (err, users) => {
            if (err) res.status(500).json(err)
            if (users.length > 0) {
                res.json({ users: users, success: true });
            } else {
                res.status(500).json({ message: "No unverified users found!", success: false });
            }
        });
    },
    getAllUnverifiedFarms: (req, res) => {
        var selectAllUnverifiedFarm = "SELECT CONCAT(U.first_name, ' ', U.last_name) as breeder_name, F.* FROM tbl_farm as F, tbl_user_profile as U WHERE F.is_verify=? and F.user_id=U.user_id;";

        connection.query(selectAllUnverifiedFarm, [0], (err, farms) => {
            if (err) res.status(500).json(err)
            if (farms.length > 0) {
                res.json({ farms: farms, success: true });
            } else {
                res.status(500).json({ success: false });
            }
        });
    },
    getTotalMonthlyInvestedMoney: (req, res) => {
        var getTotalMonthlyInvestedMoney = "SELECT * FROM table WHERE MONTH(columnName) = MONTH(CURRENT_DATE()) AND YEAR(columnName) = YEAR(CURRENT_DATE())"
    },
    getTotalDailyInvestedMoney: (req, res) => {

    },
    getTotalAnualInvestedMoney: (req, res) => {

    },
    notifyUserForPayment: (req, res) => {

    },
    openNewCycle: (req, res) => {
        var date_from = toMysqlFormat(new Date(req.body.date_from));
        var date_to = toMysqlFormat(new Date(req.body.date_to));
        var date = new Date();
        var date_created = toMysqlFormat(date);

        var createNewCycle = "INSERT INTO `tbl_cycle`(`date_from`, `date_to`, `date_created`, `is_active`) VALUES (?, ?, ?, ?)"
        connection.query(createNewCycle, [date_from, date_to, date_created, 1], (err, cycles) => {
            if (err) res.status(500).json(err)
            if (cycles.affectedRows > 0) {
                res.json({ message: "New cycle has been opened.", success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    getCycles: (req, res) => {

        var getCycles = "SELECT * FROM tbl_cycle WHERE is_active=?"
        connection.query(getCycles, [1], (err, cycles) => {
            if (err) res.status(500).json(err)
            if (cycles.length > 0) {
                res.json({ cycles: cycles, success: true });
            } else {
                res.status(404).json({ success: false, message: "No cycles found." });
            }
        });

    },
    deleteCycle: (req, res) => {
        var cycle_id = req.body.cycle_id;
        var deleteCycle = "UPDATE tbl_cycle SET is_active=? WHERE cycle_id=?"

        connection.query(deleteCycle, [0, cycle_id], (err, cycles) => {
            if (err) res.status(500).json(err)
            if (cycles.affectedRows > 0) {
                res.json({ message: "Cycle has been deleted.", success: true });
            } else {
                res.status(500).json({ success: false, message: "Cannot delete cycle." });
            }
        });
    },
    updateCycle: (req, res) => {
        var cycle_id = req.body.cycle_id;
        var date_from = toMysqlFormat(new Date(req.body.date_from));
        var date_to = toMysqlFormat(new Date(req.body.date_to));

        var updateCycle = "UPDATE `tbl_cycle` SET `date_from`=?,`date_to`=? WHERE `cycle_id`=?"
        connection.query(updateCycle, [date_from, date_to, cycle_id], (err, cycles) => {
            if (err) res.status(500).json(err)
            if (cycles.affectedRows > 0) {
                res.json({ message: "Cycle has been udpated.", success: true });
            } else {
                res.status(500).json({ success: false, message: "Cannot update cycle." });
            }
        });
    },
    getInvestmentRecords: (req, res) => {
        var getInvestmentRecords = "SELECT A.id, A.farm_id, U.user_id, A.date_started, A.number_of_rabbits, A.breed_type, A.cycle_id, A.end_of_investment, A.amount, A.status, F.farm_name, CONCAT(U.first_name, ' ', U.last_name) as investor_name, C.date_to  FROM tbl_active_investment as A, tbl_farm as F, tbl_user_profile as U , tbl_cycle as C WHERE A.farm_id=F.farm_id and A.is_active=? and A.user_id=U.user_id and C.cycle_id=A.cycle_id"

        connection.query(getInvestmentRecords, [1], (err, investments) => {
            if (err) res.status(500).json(err)
            if (investments.length > 0) {
                res.json({ recordsTotal: investments.length, data: investments, success: true });
            } else {
                res.json({ recordsTotal: investments.length, data: [], success: true });
            }
        });
    },
    updateInvestment: (req, res) => {
        console.log(req.body)
        var investment_id = req.body.id;
        var user_id = req.body.user_id;
        var status = req.body.status;
        var amount = req.body.amount;
        var selectUserVault = "SELECT * FROM tbl_vault_info WHERE user_id=?;";
        var updateInvestment = "UPDATE tbl_active_investment SET `status`=? WHERE id=?;"

        var updateVaultInfo = "UPDATE tbl_vault_info SET balance=?, active_investments=? WHERE user_id=?;";
        if (status == 1) {
            connection.query(selectUserVault, [user_id], (err, vault) => {
                if (err) {
                    res.status(500).json(err);
                }
                if (vault.length > 0) {
                    var newBalance = vault[0].balance - amount;
                    var active_investments = vault[0].active_investments + amount;
                    connection.query(updateInvestment + updateVaultInfo, [status, investment_id, newBalance, active_investments, user_id], (err, investment) => {
                        if (err) res.status(500).json(err)
                        if (investment[0].affectedRows > 0 && investment[0].affectedRows > 0) {
                            res.json({ message: "Investment status has been updated.", success: true });
                        } else {
                            res.status(500).json({ message: "Cannot update investment status.", success: false });
                        }
                    });
                } else {
                    res.status(500).json({ message: "Cannot update investment status.", success: false });
                }
            });
        } else {
            res.json({ message: "Investment status has been updated.", success: true });
        }
    },
    sendNotification: (req, res) => {
        var user_id = req.body.user_id;
        var user_type = req.body.user_type;
        var message = req.body.message;
        var subject = req.body.subject;
        var date = new Date()
        var date_created = toMysqlFormat(date);
        var is_read = 0;
        var is_active = 1;

        var addNotification = (user_type == 1) ? "INSERT INTO `tbl_investor_notification`(`user_id`, `message`, `subject`, `date_created`, `is_read`, `is_active`) VALUES (?, ?, ?, ?, ?, ?)" : "INSERT INTO `tbl_breeder_notification`(`user_id`, `message`, `subject`, `date_created`, `is_read`, `is_active`) VALUES (?, ?, ?, ?, ?, ?)"

        connection.query(addNotification, [user_id, message, subject, date_created, is_read, is_active], (err, notif) => {
            if (err) res.status(500).json(err)
            if (notif.affectedRows > 0) {
                res.json({ success: true });
            } else {
                res.status(500).json({ message: "An error occured!", success: false });
            }
        });

    },

    getMessages: (req, res) => {
        var selectAllMessages = "SELECT * FROM tbl_admin_messages as M, tbl_user_profile as U WHERE M.user_id=U.user_id ORDER BY date_added DESC"

        connection.query(selectAllMessages, (err, messages) => {
            if (err) res.status(500).json(err)
            if (messages.length > 0) {
                res.json({ messages: messages, success: true });
            } else {
                res.status(404).json({ message: "No messages found.", success: false });
            }
        });
    }

}

module.exports = AdminsController;