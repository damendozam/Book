const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');

const { database } = require('./keys');


//initialitation
const app = express();
require('./lib/passport');

//setting
app.set('port',process.env.PORT || 4000);
/*app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars')
}))
app.set('view engine', '.hbs');
//middleware
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}))
app.use(express.json())*/
//Global variable

//Routes
app.use(require('./routes'))

//Public

//Starting server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});