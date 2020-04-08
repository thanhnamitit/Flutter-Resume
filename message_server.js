const admin = require('firebase-admin');
const functions = require("firebase-functions")
const express = require('express')
const nodemailer = require('nodemailer')
const bodyParser = require('body-parser')
const cors = require('cors');

const app = express()
app.use(bodyParser.json())
app.use(cors());

admin.initializeApp(functions.config().firebase)

const api = functions.https.onRequest(app)

const authorMail = "convoitoto.help@gmail.com"
const authorPassword = "convoitoto_password"

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: authorMail,
    pass: authorPassword
  }
});

module.exports = {
  api,
}
const router = express.Router()
app.post('/message', async (req, res) => {

    const body = req.body

    const name = body['name']
    const email = body['email']
    const subject = body['subject']
    const targetMail = body['target_mail']
    const message = body['message']

    console.log(req.body)

    res.setHeader("Content-Type", "text/html");
    if(name && email && subject && targetMail && message){
        res.status(200).send({
          message: "Success",
        })
       const mailOptions = {
          from: authorMail,
          to: targetMail,
          subject: subject + ' from ' + name+" - Email: " +email,
          text: message
       };
        transporter.sendMail(mailOptions, function(error, info){
          if (error) {
            console.log(error);
          } else {
            console.log('Email sent: ' + info.response);
          }
        });
    } else {
        res.status(400).send({
          message: "Content insufficient",
        })
    }
})