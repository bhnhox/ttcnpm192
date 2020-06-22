var express = require('express');
const { Router } = require('express');
var multer = require('multer');
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/')
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
        cb(null, file.fieldname + '-' + uniqueSuffix)
    }
})

var upload = multer({ storage: storage });

var router = express.Router();

var FoodController = require('../../controller/cms/food.controller')

router.route('/')
    .get(FoodController.index)
    .post(upload.single("image"), FoodController.add)
router.post('/changeStateMenu', FoodController.changeStateMenu)
router.get('/:id', FoodController.get)
router.post('/update/:id',FoodController.update)
router.get('/delete/:id', FoodController.delete)

module.exports = router;