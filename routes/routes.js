'use strict';
const _ = require('lodash');
const state = require('../data/state');
var os = require('os');

const appRouter = function(app) {

    app.get("/ping", function(req, res) {
        let interfaces = [];
        let networkInfo;
        try {
            networkInfo = require('os').networkInterfaces();
        } catch (e) {
            networkInfo = 'UNKNOWN_OR_INACCESSIBLE';
        }
        const vers = process.env.CURRENT_VERSION || 'UNDEFINED';
        const secretMessage = process.env.SECRET_MESSAGE || 'UNKNOWN';
        const obj = {APIVersion: vers, startTime: new Date().toString(), secretMessage, processId: process.pid, memoryUsage: process.memoryUsage(), networkInfo, createTime: process.env.FT_CREATE_TIME};
        res.writeHead(200);
        res.end(JSON.stringify(obj, null, 4));
    });

    app.post("/login", function(req, res) {
        const obj = req.body;
        if(req.body.password === 'cheese'){
            res.status(200).send({
                message: 'OK',
                username:req.body.username
            });
        }else{
            res.status(401).send({
                message: 'Unauthorized',
            });
        }
    });

    app.get("/state/:username", function(req, res) {
        const username = req.params.username;
        res.send(JSON.stringify({message:`Getting State for ${username}`}));
    });

    app.post("/state/", function(req, res) {
        const obj = req.body;
        state.save(obj)
        .then(rslt =>{
            res.statusCode = 200;
            res.send(JSON.stringify({message:rslt.message}));
        }).catch(rslt =>{
            res.statusCode = 400;
            res.send(JSON.stringify({message:rslt}));
        })
    });

    app.get("/feelings/", function(req, res) {
        const data = JSON.parse(process.env['feelingsData']);
        res.send(JSON.stringify({data}));
    });

    app.get("/feelings/:username", function(req, res) {
        const username = req.params.username;
        state.get(username)
            .then(rslt =>{
                res.statusCode = 200;
                res.send(JSON.stringify({data:rslt}));
            });
    });
};

module.exports = appRouter;