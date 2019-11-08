const express = require("express");
var bodyParser = require("body-parser")
var mongodb = require("mongodb")
var app = express();
const fs = require('fs');
let student = ""


const mongoose = require("mongoose")
mongoose.set('useNewUrlParser', true);
mongoose.set('useFindAndModify', true);
mongoose.set('useCreateIndex', true);
mongoose.set('useUnifiedTopology', true);
mongoose.connect('mongodb://127.0.0.1:27017/task-manager')
var db = mongoose.connection;


//CRUD create read update delete


// const { MongoClient, ObjectID } = require('mongodb')

// const connectioURL = 'mongodb://127.0.0.1:27017'
// const databaseName = 'task-manager'

// MongoClient.connect(connectioURL, { useNewUrlParser: true }, (error, client) => {

//     if (error) {
//         return console.log('Unable to connect to the database!')
//     }

//     const db = client.db(databaseName)

//     // db.collection('users').deleteMany({
//     //     age: 27
//     // }).then((result) => {
//     //     console.log(result)
//     // }).catch((error) => {
//     //     console.log(error)
//     // })

//     // db.collection('tasks').deleteOne({ 
//     //     description: "Eat food"
//     // }).then((result) => {
//     //     console.log(result)
//     // }).catch((error) => {
//     //     console.log(error)
//     // })
    



// })





// fs.readFile('type.json', (err, data) => {
//     if (err) throw err;
//     student = JSON.parse(data);
//     console.log(student);
// });

// console.log('This is after the read call');
app.use(bodyParser.json())
app.get('/',(req,res)=>{
	db.collection('tasks').find().toArray(function(err,doc){
		res.send(doc);
	});
});


app.get('/newuser/:username/:pnum',(req,res)=>{
	var name=req.params.username;
	var ph=req.params.pnum;
	console.log(name)
	console.log(ph)
	var data = {
	"PIDID" : "PID003",
    "Doctoattend" : "nil",
    "name" : name,
    "phone" : ph,
    "isappointment" : "false",
    "appointmentime" : "nil",
    "priscription" : "nil"
	}
	db.collection("patient").insertOne(data,function(err,collection){
		if(err) throw err;
			console.log("Sucess new data added")
			fs.readFile('type.json', (err, data) => {
				if (err) throw err;
				student = JSON.parse(data);
				console.log(student);
				res.send(student)
			});
		
	})
})

app.get('/newappointment/:PID/:DOCID/:apptime',(req,res)=>{
	var paname=req.params.PID;
	var dname=req.params.DOCID;
	var time = req.params.apptime;
	var data = {
	"PIDID" : paname,
    "Doctoattend" : dname,
    "isappointment" : "true",
    "appointmentime" : time,
	}
	db.collection("appointment").insertOne(data,function(err,collection){
		if(err) throw err;
			console.log("Sucess new appointment added")
			fs.readFile('type.json', (err, data) => {
				if (err) throw err;
				student = JSON.parse(data);
				console.log(student);
				res.send(student)
			});
		
	})
})

app.get('/attendAppointment/:PID',(req, res)=>{
	var paname=req.params.PID;
	var query = { PIDID: paname };
	var newvalues = { $set: { isappointment: "false" } };
	db.collection("patient").updateOne(query, newvalues, function(err, doc) {
		if (err) throw err;
		console.log("1 document updated");
		fs.readFile('type.json', (err, data) => {
			if (err) throw err;
			student = JSON.parse(data);
			console.log(student);
			res.send(student)
		});
		
	  });

})

app.get('/getInventory',(req, res)=>{
	
	db.collection("inventory").find().toArray(function(err,doc){
		res.send(doc)
	})
})

app.listen(3000);
