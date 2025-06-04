const cors = require('cors')
const express = require('express')
const bodyParser = require('body-parser')

const app = express()
const port = 3000

app.use(cors())
app.use(bodyParser.json())
app.use(express.static('./static'))
app.use(bodyParser.urlencoded({ extended: false }))

app.get('/api/contacts', (req, res) => {
    console.log('calling API');

    const body = [
        {id: 1, name: 'Sasha', phone: '1111111111'},
        {id: 2, name: 'Levi', phone: '9999999999'},
        {id: 3, name: 'Mikasa', phone: '88888888'},
    ]
    
    res.status(200).json(body);
})

app.listen(port, () => {
    console.log('node app is listening on port: ', port)
})
