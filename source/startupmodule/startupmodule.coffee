
startupmodule = {name: "startupmodule"}
############################################################
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["startupmodule"]?  then console.log "[startupmodule]: " + arg
    return

############################################################
pg = require("pg")
client = new pg.Client({
  user: 'testuser',
  host: '10.143.13.224',
  database: 'testdb',
  password: '',
  port: 5432,
})

############################################################
startupmodule.initialize = () ->
    log "startupmodule.initialize"
    return

############################################################
startupmodule.serviceStartup = ->
    log "startupmodule.serviceStartup"
    await client.connect()
    res = await client.query('SELECT $1::text as message', ['Hello world!'])
    log(res.rows[0].message)
    await client.end()
    return

export default startupmodule

#/run/postgresql/.s.PGSQL.5432