const express = require("express");
const router = express.Router();
const User = require("./User");
const bcript = require("bcryptjs")

router.get("/admin/users", (req, res) => {

    User.findAll({
        order: [
            ['name', 'ASC']
        ]
    }).then((users) => {
        res.render("admin/users/index", { users: users });
    })
});

router.get("/admin/users/create", (req, res) => {
    res.render("admin/users/create")

});

router.post("/users/save", (req, res) => {
    var name = req.body.name;
    var email = req.body.email;
    var password = req.body.password;

    User.findOne({
        where: {
            email: email
        }
    }).then(emails => {
        
        if (emails == undefined || emails == null) {
            
            let salt = bcript.genSaltSync(10);
            let hash = bcript.hashSync(password, salt);
            User.create({
                name: name,
                email: email,
                password: hash

            }).then(() => {
                res.redirect("/admin/users/index");
            }).catch((error) => {
                
                res.redirect("/admin/users/create");
            });
        }else{
            res.redirect("/admin/users/create")
        }
    })


});



router.get("/login", (req, res) =>{
    res.render("admin/users/login")
});

router.post("/authenticate", (req,res) =>{
    var email = req.body.email;
    var password = req.body.password;

    User.findOne({ 
        where: {email: email}
    }).then(user =>{

        if (user != undefined && user != null) {
            var correct = bcript.compareSync(password, user.password);
            if (correct) {
               var userSession = req.session.user = {
                    id: user.id,
                    email: user.email,
                    name: user.name
                }
            res.redirect("/admin/articles");
                
            }else{
                res.redirect("/login");
            }
            
        }else{
            res.redirect("/login");  
        }
    }) 
 
});

router.get("/logout",(req, res) =>{
    req.session.user = undefined
    res.redirect("/");
});


module.exports = router;