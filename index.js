const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const session = require("express-session");
// =========== Session ==============

const connection = require('./database/database');

// @@@@ ROTAS USANDO ROUTER
const articlesController = require("./articles/ArticlesController");
const categoriesController = require("./categories/CategoriesController");
const usersController = require("./users/UsersController");

// -------- MODELS ----------
const Article = require("./articles/Article");
const Category = require("./categories/Category");

//Configura a view engine para exibir html
app.set('view engine', 'ejs');


// @@ CONFIGURAR O EXPRESS ACEITAR ARQUIVOS STATICOS EXEMPLO (CSS, IMAGENS)
// Static
app.use(express.static('public'));

// OBS: PARA VIEW FUNCIONA DEVE TER UMA PASTA COM ESSE NOME: views

// @@ CONFIGURA BODY-PARSER PARA TRABALHAR COM FORMULARIO
app.use(bodyParser.urlencoded({ extends: false }));
app.use(bodyParser.json());

app.use(session({
    secret: 'rocha',
    cookie: { maxAge: 300000 }
}));

app.use("/", categoriesController);
app.use("/", articlesController);
app.use("/", usersController);


// @@@@ CONECTANDO COM BANCO
connection
    .authenticate()
    .then(() => {
        console.log("Banco conectado!");
    }).catch((error) => {
        console.log("Banco com erro de conexão!");
    });



app.get("/session", (req, res) => {
    req.session.meuValor = 'Olá, mundo!';
    req.session.user = { name: "manoel", email: "manoel@gmail.com" };
    res.send("Criado")
});

app.get("/leitura", (req, res) => {
    res.json({ user: req.session.user });

});

app.get("/", (req, res) => {
    var next = false;
    var limit = 3;
    var result;

    Article.findAndCountAll({
        order: [
            ['id', 'DESC']
        ],
        limit: limit
    }).then(articles => {
        if (articles.count > limit) {
            next = true
        }
        result = {
            articles: articles,
            next: next
        }
        Category.findAll().then(categories => {
            res.render("index", { result: result, categories: categories });
        });
    })
});

app.get("/:slug", (req, res) => {
    let slug = req.params.slug;
    Article.findOne({
        where: {
            slug: slug
        }
    }).then(article => {
        if (article != undefined) {
            Category.findAll().then(categories => {
                res.render("articles", { article: article, categories: categories });
            });
        } else {
            res.redirect("/")
        }
    }).catch(erro => {
        res.redirect("/")
    });
})

app.get("/category/:slug", (req, res) => {
    var slug = req.params.slug;
    Category.findOne({
        where: {
            slug: slug
        },
        include: [{ model: Article }]
    }).then(category => {
        if (category != undefined) {
            Category.findAll().then(categories => {
                res.render("index", { articles: category.articles, categories: categories });
            })
        } else {
            res.redirect("/");
        }
    }).catch(error => {
        res.redirect("/");
    })
})

app.listen(21055, () => {
    console.log("Servidor ok");
});