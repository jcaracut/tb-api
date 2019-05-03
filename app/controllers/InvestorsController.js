var toMysqlFormat = require("../includes/mySQLFormat");
var connection = require("../db/db_bunny.js");
var ImageUploader = require("../services/ImageUploaderService");
var FileUploader = require("../services/FileUploaderService");
var image2base64 = require('image-to-base64');


var InvestorsController = {

    getListOfInvestedFarms: (req, res) => {
        var user_id = req.user.user_id;

        const selectInvestedFarms = "SELECT DISTINCT(F.farm_id), F.*  FROM tbl_active_investment as A, tbl_farm as F WHERE A.user_id=? and F.farm_id=A.farm_id"

        connection.query(selectInvestedFarms, [user_id], (err, farms) => {
            if (farms.length > 0) {
                res.json({ farms: farms, success: true })
            } else {
                res.status(500).json({ success: false, messsage: 'No invested farms' })
            }
        });

    },
    getListOfInvestedRabbits: (req, res) => {
        var user_id = req.user.user_id;
        var farm_id = req.query.farm_id
        const selectInvestedRabbit = "SELECT A.amount, A.number_of_rabbits, R.* FROM tbl_active_investment as A, tbl_rabbit as R WHERE A.user_id=? and A.farm_id=? and R.farm_id=?"

        connection.query(selectInvestedRabbit, [user_id, farm_id, farm_id], (err, rabbits) => {
            if (err) res.status(500).json({ err: err });
            if (rabbits.length > 0) {
                res.json({ rabbits: rabbits })
            } else {
                res.status(500).json({ success: false });
            }
        });
    },
    getAvailableFarms: (req, res) => {

        // var cycle_id = req.body.cycle_id;
        var farms = [];
        var date_now = toMysqlFormat(new Date());

        const selectUsersJoinedCurentCycle = "SELECT user_id FROM tbl_investment_cycle WHERE cycle_id=?"
        const selectAvailableFarm = "SELECT * FROM tbl_farm WHERE user_id=? and is_active=? and is_verify=?"
        const selectCurrentCycle = "SELECT * FROM `tbl_cycle` WHERE date_from<=? AND date_to>=? and is_active=1"

        connection.query(selectCurrentCycle, [date_now, date_now], (err, cycles) => {
            if (err) res.status(500).json({ err: err });
            if (cycles.length > 0) {
                var cycle_id = cycles[0].cycle_id;
                connection.query(selectUsersJoinedCurentCycle, [cycle_id], (err, userIDs) => {
                    if (err) res.status(500).json({ err: err });
                    if (userIDs.length > 0) {
                        var count = 0;
                        userIDs.forEach(e => {
                            connection.query(selectAvailableFarm, [e.user_id, 1, 1], (err, farm) => {
                                if (err) res.status(500).json({ err: err });
                                count += 1;
                                var temp = 0;
                                farm.forEach(f => {
                                    farms.push(f)
                                    temp += 1;
                                    if (farm.length == temp && userIDs.length == count) res.json({ farms: farms })
                                });
                            });
                        });
                    } else {
                        res.json({ messsage: "No farms available", success: false })
                    }
                });
            } else {
                res.json({ messsage: "No farms available", success: false })
            }
        });

    },
    getAvailableRabbits: (req, res) => {
        var farm_id = req.query.farm_id
        const selectAvailableRabbits = "SELECT * FROM tbl_rabbit WHERE farm_id=? and is_active=? and is_available=?"

        connection.query(selectAvailableRabbits, [farm_id, 1, 1], (err, rabbits) => {
            if (err) res.status(500).json({ err: err });
            if (rabbits.length > 0) {
                res.json({ rabbits: rabbits, success: false })
            } else {
                res.status(404).json({ success: false, message: "No available rabbits found." });
            }
        });
    },

    getFarmExpensesLog: (req, res) => {
        var farm_id = req.body.farm_id;

        const selectFarmExpenses = "SELECT * FROM tbl_farm_expenses WHERE farm_id=?"

        connection.query(selectFarmExpenses, [farm_id], (err, expenses) => {
            if (err) res.status(500).json({ err: err })
            if (expenses.length > 0) {
                res.json({ expenses: expenses, success: true });
            } else {
                res.status(404).json({ success: false, messsage: "No expenses found." });
            }
        });

    },
    getDirectorSign: (req, res) => {
        image2base64("https://s3.amazonaws.com/bunney/assets/images/director-sign.png") // you can also to use url
            .then(
                (response) => {
                    res.json({ image: "data:image/png;base64, " + response }); //cGF0aC90by9maWxlLmpwZw==
                }
            )
            .catch(
                (error) => {
                    res.json({ message: error });
                }
            )
    },
    addToCart: (req, res) => {
        console.log(req.body)
        var user_id = req.user.user_id;
        var rabbit_id = req.body.rabbit_id;
        var quantity = req.body.quantity;
        var dateCreated = toMysqlFormat(new Date());
        var addRabbitToCart = "INSERT INTO `tbl_cart`(`user_id`, `rabbit_id`, `date_added`, number_of_rabbits) VALUES (?, ? , ?, ?)"
        var selectRabbit = "SELECT * FROM tbl_cart WHERE user_id=? and rabbit_id=?"
        var updateCart = "UPDATE tbl_cart SET number_of_rabbits=? WHERE cart_id=?"

        connection.query(selectRabbit, [user_id, rabbit_id], (err, cart) => {
            if (err) res.status(500).json(err)

            if (!cart.length > 0) {
                connection.query(addRabbitToCart, [user_id, rabbit_id, dateCreated, req.body.quantityToInvest], (err, cart) => {
                    if (err) res.status(500).json(err)
                    if (cart.affectedRows > 0) {
                        res.json({ success: true });
                    } else {
                        res.json({ success: false, message: "Cannot add rabbit(s) to your cart." });
                    }
                });
            } else {
                var quantity1 = req.body.quantityToInvest + cart[0].number_of_rabbits;
                var cart_id = cart[0].cart_id
                if (quantity1 <= quantity) {
                    connection.query(updateCart, [quantity1, cart_id], (err, cart) => {
                        if (err) res.status(500).json(err)
                        if (cart.affectedRows > 0) {
                            res.json({ success: true });
                        } else {
                            res.status(500).json({ success: false, message: "Cannot add rabbit(s) to your cart." });
                        }
                    });
                } else {
                    res.status(500).json({ success: false, message: "Not enough rabbits." });
                }
            }
        });
    },
    deleteFromCart: (req, res) => {
        var cart_id = req.body.cart_id;
        var addRabbitToCart = "DELETE FROM tbl_cart WHERE cart_id=?"

        connection.query(addRabbitToCart, [cart_id], (err, cart) => {
            if (err) res.status(500).json(err)
            if (cart.affectedRows > 0) {
                res.json({ success: true });
            } else {
                res.json({ success: false });
            }
        });
    },
    getCart: (req, res) => {
        var user_id = req.user.user_id;
        var getCartDetails = "SELECT C.cart_id,  C.number_of_rabbits, C.number_of_rabbits * R.amount as amount, R.rabbit_id, R.farm_id, R.breed_type, F.farm_name FROM tbl_rabbit as R, tbl_farm as F, tbl_cart as C WHERE C.user_id=? and C.rabbit_id=R.rabbit_id and R.farm_id=F.farm_id"
        connection.query(getCartDetails, [user_id], (err, cart) => {
            if (err) res.status(500).json(err)
            if (cart.length > 0) {
                res.json({ cart: cart, success: true });
            } else {
                res.json({ cart: [], success: false });
            }
        });
    },
    uploadContract: function (req, res) {
        var user_id = req.user.user_id;
        req.filename = Date.now() + "-contract.pdf"
        FileUploader.uploadContract(req, res, function (err) {
            if (err) res.status(500).json({ success: false });
            if (!req.body && !req.files) {
                res.json({ success: false });
            } else {
                var date = new Date();
                var date_created = toMysqlFormat(date);
                var insertContractRecord = "INSERT INTO `tbl_contract`(`user_id`, `date_created`, `is_active`, `file`) VALUES (?, ?, ?, ?)"

                connection.query(insertContractRecord, [user_id, date_created, 1, req.filename], (err, contract) => {
                    if (err) res.status(500).json(err)
                    if (contract.affectedRows > 0) {
                        res.json({ success: true });
                    } else {
                        res.json({ success: false });
                    }
                });
            }
        });
    },
    getContracts: function (req, res) {
        var user_id = req.user.user_id;
        var getContracts = "SELECT * FROM `tbl_contract` WHERE user_id=? ORDER by date_created DESC"

        connection.query(getContracts, [user_id], (err, contracts) => {
            if (err) res.status(500).json(err)
            if (contracts.length > 0) {
                res.json({ contracts: contracts, success: true });
            } else {
                res.status(404).json({ success: false, messsage: "No contracts found" });
            }
        });
    },
    addActiveInvestment: function (req, res) {
        var user_id = req.user.user_id;
        var farm_id = req.body.farm_id;
        var date_started = toMysqlFormat(new Date());
        var number_of_rabbits = req.body.number_of_rabbits;
        var amount = req.body.amount;
        var breed_type = req.body.breed_type;
        var end_of_investment = date_started;
        var is_active = 1;

        var addActiveInvestment = "INSERT INTO `tbl_active_investment`(`farm_id`, `user_id`, `date_started`, `number_of_rabbits`, `breed_type`, `cycle_id`, `end_of_investment`, `is_active`, `amount`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"

        var selectCurrentCycle = "SELECT * FROM `tbl_cycle` WHERE date_from<=? AND date_to>=?"


        connection.query(selectCurrentCycle, [date_started, date_started], (err, cycle) => {
            if (err) console.log(err)
            if (cycle.length > 0) {
                var cycle_id = cycle[0].cycle_id;
                connection.query(addActiveInvestment, [farm_id, user_id, date_started, number_of_rabbits, breed_type, cycle_id, end_of_investment, is_active, amount], (err, investment) => {
                    if (err) res.status(500).json(err)
                    if (investment.affectedRows > 0) {
                        res.json({ success: true });
                    } else {
                        res.status(500).json({ success: false, messsage: "Cannot insert data!" });
                    }
                });
            } else {
                res.status(500).json({ success: false, messsage: "Cannot insert data! No cycle available." });
            }
        });

    },
    getActiveInvestments: function (req, res) {
        var user_id = req.user.user_id;
        var getActiveInvestment = "SELECT A.*, C.date_to, F.farm_name FROM tbl_active_investment as A, tbl_farm as F, tbl_cycle as C WHERE A.user_id=? and A.farm_id=F.farm_id and A.is_active=? and C.cycle_id=A.cycle_id"

        connection.query(getActiveInvestment, [user_id, 1], (err, investments) => {
            if (err) res.status(500).json(err)
            if (investments.length > 0) {
                res.json({ recordsTotal: investments.length, data: investments, success: true });
            } else {
                res.json({ recordsTotal: investments.length, data: [], success: true });
            }
        });
    },
    updateRabbitStatus: (req, res) => {
        var user_id = req.user.user_id
        var rabbit_id = req.body.rabbit_id;
        var quantity = req.body.number_of_rabbits;

        var updateRabbit = "UPDATE tbl_rabbit SET quantity=? WHERE rabbit_id=?;";
        var updateCart = "DELETE FROM tbl_cart WHERE user_id=? and rabbit_id=?;";

        var selectRabbit = "SELECT * FROM tbl_rabbit WHERE rabbit_id=?"


        connection.query(selectRabbit, [rabbit_id], (err, rabbit) => {
            if (err) res.json(err)
            var r = rabbit[0];
            quantity = r.quantity - quantity;
            if (rabbit.length > 0) {
                connection.query(updateRabbit + updateCart, [quantity, rabbit_id, user_id, rabbit_id], (err, rabbits) => {
                    if (err) res.json(err)
                    console.log(rabbits);
                    if (rabbits[0].affectedRows > 0 && rabbits[1].affectedRows > 0) {
                        res.json({ message: "success", success: true });
                    } else {
                        res.json({ message: "Cannot update rabbit quantity.", success: true });
                    }
                });
            } else {
                res.json({ message: "Rabbit not found.", success: true });
            }
        });

    },
    addPaymentDetails: (req, res) => {
        var user_id = req.user.user_id;
        var payment_option = req.body.payment_option;
        var sender = req.body.sender;
        var number = req.body.number;
        var address = req.body.address;
        var amount = req.body.amount;
        var reciept_date = req.body.reciept_date;

        connection.query(updateRabbit + updateCart, [0, user_id, rabbit_id, rabbit_id], (err, rabbits) => {
            if (err) res.json(err)
            if (rabbits.affectedRows > 0) {
                res.json({ message: "success", success: true });
            }
        });
    },
    uploadPaymentReciept: (req, res) => {
        ImageUploader.uploadPaymentReciept
        connection.query(updateRabbit + updateCart, [0, user_id, rabbit_id, rabbit_id], (err, rabbits) => {
            if (err) res.json(err)
            if (rabbits.affectedRows > 0) {
                res.json({ message: "success", success: true });
            }
        });
    },
    getRemainingCycleDays: (req, res) => {
        var date = new Date();
        var date_now = toMysqlFormat(date)
        var selectCurrentCycle = "SELECT * FROM `tbl_cycle` WHERE date_from<=? AND date_to>=?"
        var selectDateDiff = "SELECT DATEDIFF(?, ?) as number_of_days_left, DATEDIFF(?, ?) as total_number_of_days"

        connection.query(selectCurrentCycle, [date_now, date_now], (err, cycle) => {
            if (err) res.json(err)
            if (cycle.length > 0) {
                var cycle_end_date = cycle[0].date_to;
                var cycle_start_date = cycle[0].date_from;
                connection.query(selectDateDiff, [cycle_end_date, date_now, cycle_end_date, cycle_start_date], (err, diff) => {
                    if (err) res.status(500).json(err)
                    res.json({ data: diff[0], success: true });
                });
            }
        });
    },
    sendBreederInvestmentNotification: (req, res) => {
        var date = new Date();
        var date_created = toMysqlFormat(date)
        var user_id = req.body.user_id;
        var message = req.body.message;
        var subject = "New Rabbit invested by ";
        var from = req.user.first_name + " " + req.user.last_name;

        var sendNotificationToBreeder = "INSERT INTO `tbl_breeder_notification`(`user_id`, `message`, `subject`, `date_created`, `is_read`, `is_active`, `from`) VALUES ()"
        connection.query(sendNotificationToBreeder, [user_id, message, subject, date_created, 0, 1, from], (err, notif) => {
            if (err) res.json(err)
            if (cycle.length > 0) {

            }
        });
    }

}


module.exports = InvestorsController;