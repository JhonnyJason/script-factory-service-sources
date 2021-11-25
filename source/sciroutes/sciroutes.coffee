sciroutes = {}

import h from "./scihandlers"

############################################################
#region 
############################################################
sciroutes.addNewFragment = (req, res) ->
    try
        response = await h.addNewFragment()
        res.send(response)
    catch err then res.send({error: err.stack})
    return

sciroutes.setFragment = (req, res) ->
    try
        response = await h.setFragment(req.body.fragmentId, req.body.fragmentContent)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

sciroutes.getFragment = (req, res) ->
    try
        response = await h.getFragment(req.body.fragmentId)
        res.send(response)
    catch err then res.send({error: err.stack})
    return

#endregion



export default sciroutes
