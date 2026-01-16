require("dotenv").config();
const express = require("express");
const app = express();
const port = process.env.port || 8000
const { connection } = require("./middleware/db");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const path = require("path");
const cookieParser = require("cookie-parser");
const flash = require("connect-flash");
const session = require("express-session");
const { publicsocket } = require("./public/publicsocket")



app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 1000 * 60 }
}))
app.use((req, res, next) => {
  const skipDb = String(process.env.SKIP_DB || '').toLowerCase();
  if (skipDb === 'true' || skipDb === '1') {
    res.locals.scriptFile = '';
    return next();
  }

  connection.query("SELECT data FROM tbl_zippygo_validate", (err, results) => {
    if (err) {
      console.log('Error executing query:', err);
      res.locals.scriptFile = '';
      return next();
    }
    const scriptFile = results && results[0] && results[0].data ? results[0].data : '';
    res.locals.scriptFile = scriptFile;
    next();
  });
});




app.use(flash());

app.set('view engine', 'ejs');
app.set("views", path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.use(bodyParser.urlencoded({ extended: true, limit: '10mb' }));
app.use(bodyParser.json({ limit: '10mb' }));
app.use(express.json());
app.use(cookieParser());

app.use(function (req, res, next) {
  res.locals.success = req.flash("success");
  res.locals.errors = req.flash("errors");
  next();
});



// ============= Mobile ================ //
app.use("/customer", require("./route_mobile/customer_api"));
app.use("/driver", require("./route_mobile/driver_api"));
app.use("/chat", require("./route_mobile/chat"));
app.use("/payment", require("./route_mobile/payment"));



// ============= Web ================ //
app.use("/", require("./router/login"));
app.use("/", require("./router/index"));
app.use("/settings", require("./router/settings"));
app.use("/vehicle", require("./router/vehicle"));
app.use("/zone", require("./router/zone"));
app.use("/outstation", require("./router/outstation"));
app.use("/rental", require("./router/rental"));
app.use("/package", require("./router/package"));
app.use("/customer", require("./router/customer"));
app.use("/driver", require("./router/driver"));
app.use("/coupon", require("./router/coupon"));
app.use("/report", require("./router/report"));
app.use("/role", require("./router/role_permission"));
app.use("/rides", require("./router/ride"));
app.use("/subscription", require("./router/subscription"));


const http = require("http");
const httpServer = http.createServer(app);
const { Server } = require("socket.io");
const io = new Server(httpServer,

);

publicsocket(io);

// Export io instance for use in routes
app.getIO = () => io;
module.exports.io = io;

// ============= Cron Jobs ================ //
// Initialize subscription expiration cron job
require("./cron/subscription_expiration");

httpServer.listen(port, () => {
  console.log(`Server running on port ${port}`);
});