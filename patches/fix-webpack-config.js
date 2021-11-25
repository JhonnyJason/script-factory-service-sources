#!/usr/bin/env node
const fs = require("fs")
const pathModule = require("path")

//############################################################
//#region exeugly
const dummyFilePath = "toolset/build/js/pg-native.js"
const dummyFileFullPath = pathModule.resolve(process.cwd(), dummyFilePath)

const dummyFileContent = "module.exports = null;"
const addedFix = {
    "resolve": {
        "alias": {
            "pg-native": dummyFileFullPath
        }
    }
}

const exportsString = "module.exports = "

//############################################################
//#region configFileStuff
const deployConfigName = "webpack-deploy.config.js"
const devConfigName = "webpack-dev.config.js"
const watchConfigName = "webpack-watch.config.js"

const deployConfigPath = pathModule.resolve(process.cwd(), ".build-config", deployConfigName)
const devConfigPath = pathModule.resolve(process.cwd(), ".build-config", devConfigName)
const watchConfigPath = pathModule.resolve(process.cwd(), ".build-config", watchConfigName)

var deployConfig = {}
var devConfig = {}
var watchConfig = {}

try {deployConfig = require(deployConfigPath)} catch(error) {}
try {devConfig = require(devConfigPath)} catch(error) {}
try {watchConfig = require(watchConfigPath)} catch(error) {}

devConfig = Object.assign(devConfig, addedFix)
watchConfig = Object.assign(watchConfig, addedFix)
deployConfig = Object.assign(deployConfig, addedFix)

//############################################################
//#region execute

const devConfigString = exportsString + JSON.stringify(devConfig, null, 4)
const watchConfigString = exportsString + JSON.stringify(watchConfig, null, 4)
const deployConfigString = exportsString + JSON.stringify(deployConfig, null, 4)

fs.writeFileSync(dummyFileFullPath, dummyFileContent)

fs.writeFileSync(devConfigPath, devConfigString)
fs.writeFileSync(watchConfigPath, watchConfigString)
fs.writeFileSync(deployConfigPath, deployConfigString)
