var express = require('express');
const { Router } = require('express');
var multer = require('multer');
var fs = require('fs');
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        if (!fs.existsSync('public/uploads/'+req.baseUrl.split("/")[2]+"/")){
            fs.mkdirSync('public/uploads/'+req.baseUrl.split("/")[2]+"/");
        }
        cb(null, 'public/uploads/'+req.baseUrl.split("/")[2]+"/")
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
        cb(null, file.fieldname + '-' + uniqueSuffix + '-' + file.originalname);
    }
})

var upload = multer({ storage: storage });

var router = express.Router();

var FoodController = require('../../controller/cms/food.controller')

router.route('/')
    .get(FoodController.index)
    .post(upload.single("image"),function(req,res,next){
        console.log(req.file);
        next();
    }, FoodController.add)
router.post('/changeStateMenu', FoodController.changeStateMenu)
router.get('/:id', FoodController.get)
router.post('/update/:id',upload.single('image'),FoodController.update)
router.get('/delete/:id', FoodController.delete)

module.exports = router;