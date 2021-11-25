scihandlers = {}

############################################################
#region 
# s = require("./s")

############################################################
scihandlers.authenticate = (req, res, next) ->
    authCode = req.body.authCode
    if authCode == "deadbeef" then next()
    else throw new Error("Invalid AuthCode!")
    return

#endregion

############################################################
#region 
############################################################
scihandlers.addNewFragment = ->
    ## add fragment in DB
    return {fragmentId}

############################################################
scihandlers.setFragment = (id, content)->
    ## write fragment content
    return {ok: true}

############################################################
scihandlers.getFragment = (id)->
    ## retrieve Fragment from DB?
    return {fragmentContent}


#endregion



export default scihandlers
