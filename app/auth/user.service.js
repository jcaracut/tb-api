module.exports = {
    getAll,
    verifyToken
};

async function getAll() {
    return users.map(u => {
        var { password, ...userWithoutPassword } = u;
        return userWithoutPassword;
    });
}

async function verifyToken(req, res, next) {
    var bearerHeader = req.headers['authorization'];
    if (!bearerHeader) {
        res.sendStatus(401).send("Unauthorized request");
    }
    var bearerToken = bearerHeader.split(" ")[1];
    if (bearerToken === 'null'){
        res.sendStatus(401).send("Unauthorized request");
    }
    var token = jwt.verify(bearerToken, 'bunneykey');
    if(!token){
        res.sendStatus(401).send("Unauthorized request");
    }
    req.token = bearerToken;
    console.log(req.tokens);
    next();
}