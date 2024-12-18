const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

require('dotenv').config();

const PORT = process.env.PORT;

const app = express();

const options = {
    host: process.env.HOST,
    database: process.env.DATABASE,
    user: 'ticketuser',
    password: process.env.PASSWORD,
    connectionLimit: 10
};

const pool = mysql.createPool(options);

app.use(cors());
app.use(express.json());

app.post("/ticket", (req, res) => {
    const ticket = req.body;

    const summary = req.body.summary;
    const priority = req.body.priority;
    const status = req.body.status;
    
    pool.query('INSERT INTO ticket (summary, priority, status ) values ( ?, ?, ? )', [summary, priority, status], (error, result) => {
        if( error ) {
            console.error(error);
            res.send(error);
            return;
        }

        res.send({  ...ticket, id: result.insertId });
    });
});

app.put("/ticket/:id", (req, res) => {
    const id = req.params.id;
    const ticket = req.body;
    pool.query('UPDATE ticket SET ? where id = ? ', [ticket, id], (error, result) => {
        if( error ) {
            console.error(error);
            res.send(error);
            return;
        }

        res.send(ticket);
    });
})

app.delete('/ticket/:id', (req, res) => {
    const id = req.params.id;
    pool.query('delete FROM ticket where id = ?', [id], (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send("success");
    });
});

app.get('/ticket/:id', (req, res) => {
    const id = req.params.id;
    pool.query('SELECT * FROM ticket where id = ?', [id], (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send(result);
    });
});


app.post("/message", (req, res) => {
    const messageBody = req.body;

    const id = messageBody.ticket_id;
    const username = messageBody.username;
    const message = messageBody.messages;

    // alert( id = ' ' + username + ' ' + message);
    
    pool.query('INSERT INTO update_messages (ticket_id, username, messages ) values ( ?, ?, ? )', [id, username,  message], (error, result) => {
        if( error ) {
            console.error(error);
            res.send(error);
            return;
        }

        res.send({  ...messageBody, id: result.insertId });
    });
});

app.get("/message/:id", (req, res) => {
    const id = req.params.id;
    pool.query('SELECT * FROM update_messages where ticket_id = ?', [id], (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send(result);
    });
});

app.get("/change/:id/:status", (req, res ) => {
    const id = req.params.id;
    const status = req.params.status;

    pool.query("Update ticket set status = ? where id = ?", [status, id], (error, result ) => {
        if( error ) {
            console.error(error);
            res.send(error);
            return;
        }

        res.send("Update successfully completed")
    })
});

app.get("/all", (req, res) => {
    pool.query('SELECT * FROM ticket', (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send(result);
    });
});

app.get("/pending", (req, res) => {
    pool.query('SELECT * FROM ticket where status not like "completed"', (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send(result);
    });
});

app.get("/pending/:column/:method", (req, res) => {
    const method = req.params.method;
    const column = req.params.column;

    pool.query(getPendingSql( column, method ), (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 
        res.send(result);
    });
});

const getPendingSql = ( column, method ) => {
    if ( column === 'priority' ) {
        return  "select * from ticket where status not like 'completed' order by case priority when 'HIGH' then 1 when 'MEDIUM' then 2 when 'LOW' then 3 end " + method;
    } else if ( column == 'status' ) {
        return  "SELECT * FROM ticket where status not like 'completed' order by case status when 'CREATED' then 1 when 'IN_PROGRESS' then 2 end " + method;
    } else {
        return  "SELECT * FROM ticket where status not like 'completed' order by " +  column + ' ' + method;
    }
}

app.get("/completed", (req, res) => {
    pool.query('SELECT * FROM ticket where status = "completed"', (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 

        res.send(result);
    });
});

app.get("/completed/:column/:method", (req, res) => {
    const method = req.params.method;
    const column = req.params.column;

    pool.query(getCompleteSql( column, method ), (error, result) => {
        if (error){
            console.error(error);
            res.send(error);
            return;
        } 
        res.send(result);
    });
});

const getCompleteSql = ( column, method ) => {
    if ( column === 'priority' ) {
        return  "select * from ticket where status = 'completed' order by case priority when 'HIGH' then 1 when 'MEDIUM' then 2 when 'LOW' then 3 end " + method;
    } else if ( column == 'status' ) {
        return  "SELECT * FROM ticket where status = 'completed' order by case status when 'CREATED' then 1 when 'IN_PROGRESS' then 2 end " + method;
    } else {
        return  "SELECT * FROM ticket where status = 'completed' order by " +  column + ' ' + method;
    }
}
app.listen(PORT, () => {
    console.log(`server started on port ${PORT}`);
});