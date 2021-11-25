
startupmodule = {name: "startupmodule"}
############################################################
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["startupmodule"]?  then console.log "[startupmodule]: " + arg
    return

############################################################
pg = require("pg")
client = new pg.Client({
  user: 'testuser',
  host: '/run/postgresql',
  database: 'testdb',
  password: '',
  port: 5432,
})

############################################################
sci = null

############################################################
startupmodule.initialize = ->
    log "startupmodule.initialize"
    sci = allModules.scimodule
    return

############################################################
startupmodule.serviceStartup = ->
    log "startupmodule.serviceStartup"
    sci.prepareAndExpose()

    await client.connect()
    res = await client.query('SELECT $1::text as message', ['Hello world!'])
    log(res.rows[0].message)
    await client.end()
    return

export default startupmodule

#/run/postgresql/.s.PGSQL.5432