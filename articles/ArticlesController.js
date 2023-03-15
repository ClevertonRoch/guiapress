const express = require("express");
const router = express.Router();
const Category = require("../categories/Category");
const Articles = require("./Article");
const slugify = require("slugify");
const adminAuth = require("./../middleware/adminAuth")

router.get("/admin/articles", adminAuth,(req, res) => {
    Articles.findAll({
        include: [{ model: Category }]
    }).then(articles => {
        // console.log(articles);
        res.render("admin/articles/index", { articles: articles })
    })
});

router.get("/admin/articles/new", adminAuth,(req, res) => {
    Category.findAll().then(categories => {
        res.render("admin/articles/new", { categories: categories })
    })

});

router.post("/articles/new", adminAuth, (req, res) => {
    let title = req.body.title;
    let body = req.body.body;
    let id = req.body.category;

    Articles.create({
        title: title,
        slug: slugify(title),
        body: body,
        categoryId: id
    }).then(() => {
        res.redirect("/admin/articles")
    })

});

router.post("/articles/delete", adminAuth,(req, res) => {
    let id = req.body.id;

    if (id != undefined && !isNaN(id)) {
        Articles.destroy({
            where: {
                id: id
            }
        }).then(() => {
            res.redirect("/admin/articles")
        })
    } else {
        res.redirect("/admin/articles")
    }


})

router.get("/admin/articles/edit/:id", adminAuth, (req, res) => {
    let id = req.params.id;
    if (id != undefined && !isNaN(id)) {
        Articles.findByPk(id, {
            include: [{ model: Category }]

        }).then(articles => {
            if (articles != undefined) {
                Category.findAll({ raw: true }).then(categories => {
                    res.render("admin/articles/edit", { articles: articles, categories: categories })
                })
            } else {
                res.redirect("/admin/articles")
            }
        })
    } else {
        res.redirect("/admin/articles")
    }

});

router.post("/articles/update", adminAuth, (req, res) => {
    let articleId = req.body.articleId;
    let title = req.body.title;
    let slug = slugify(req.body.title);
    let body = req.body.body;
    let categoryId = req.body.category;

    if (title != undefined && body != undefined && articleId != undefined && !isNaN(articleId)) {
        Articles.update({
            title: title,
            slug: slug,
            body: body,
            categoryId: categoryId
        }, {
            where: { id: articleId }
        }).then(() => {
            res.redirect("/admin/articles");
        }).catch(error => {
            res.redirect("/admin/articles", { error })
        })
    } else {
        res.redirect("/admin/articles");
    }
});


router.get("/articles/page/:num", (req, res) => {
    var next;
    var result;
    var limit = 3;
    var offset = 0;
    
    if (parseInt(req.params.num) != undefined) {
        var page = parseInt(req.params.num);
        if (page == 1) {
            offset = 0;
        }else{
            offset = (page - 1) * limit;
        }
    }else{
        offset = 0;
    }
    Articles.findAndCountAll({
        limit: limit,
        offset: offset,
        order: [['id', 'DESC']]
    }).then(articles => {

        if (offset + limit >= articles.count) {
            next = false;
        }else{
            next = true;
        }

        result = {
            page: page,
            next: next,
            articles: articles
        }

        Category.findAll().then(categories =>{
            res.render("admin/articles/page",{result: result, categories: categories})
        })
    })

});

module.exports = router;