###
Crafting Guide - constants.coffee

Copyright (c) 2014-2015 by Redwood Labs
All rights reserved.
###

# Minecraft must be first
exports.DefaultMods = [
    'minecraft',
    'applied_energistics_2',
    'buildcraft',
    'enderio',
    'industrial_craft_2',
    'railcraft',
    'thermal_expansion',
]

exports.Duration = Duration = {}
Duration.snap    = 200
Duration.fast    = Duration.snap * 2
Duration.normal  = Duration.fast * 2
Duration.slow    = Duration.normal * 2

exports.Event        = Event = {}
Event.add            = 'add'            # collection, item...
Event.change         = 'change'         # model
Event.load           = {}
Event.load.started   = 'load:started'   # controller, url
Event.load.succeeded = 'load:succeeded' # controller, book
Event.load.failed    = 'load:failed'    # controller, error message
Event.load.finished  = 'load:finished'  # controller
Event.remove         = 'remove'         # collection, item...
Event.request        = 'request'        # model
Event.route          = 'route'
Event.sort           = 'sort'
Event.sync           = 'sync'           # model, response

exports.Key = Key = {}
Key.Return = 13

exports.Opacity = Opacity = {}
Opacity.hidden  = 1e-6
Opacity.shown   = 1

exports.RequiredMods = [ 'minecraft' ]

exports.ModelState  = ModelState = {}
ModelState.unloaded = 'unloaded'
ModelState.loading  = 'loading'
ModelState.loaded   = 'loaded'
ModelState.failed   = 'failed'

exports.Text = Text = {}
Text.title = 'Crafting Guide for Minecraft | The Ultimate Step-by-Step Tutorial for Making Anything in Minecraft'

switch global.env
    when 'development'
        siteUrl = 'http://localhost:8000'
        dataUrl = 'http://localhost:8000'
    when 'staging'
        siteUrl = 'http://new.crafting-guide.com'
        dataUrl = 'http://andrewminer.github.io/crafting-guide-data'
    when 'production'
        siteUrl = 'http://crafting-guide.com'
        dataUrl = 'http://andrewminer.github.io/crafting-guide-data'

exports.Url      = Url = {}
Url.crafting     = _.template "#{siteUrl}/crafting/<%= inventoryText %>"
Url.itemIcon     = _.template "#{dataUrl}/<%= modSlug %>/<%= modVersion %>/images/<%= itemSlug %>.png"
Url.item         = _.template "#{siteUrl}/mod/<%= modSlug %>/<%= itemSlug %>"
Url.mod          = _.template "#{siteUrl}/mod/<%= modSlug %>"
Url.modData      = _.template "#{dataUrl}/<%= modSlug %>/mod.cg"
Url.modVersion   = _.template "#{dataUrl}}/<%= modSlug %>/<%= modVersion %>/mod-version.cg"
Url.modLogoImage = _.template "#{dataUrl}/<%= modSlug %>/logo.png"

exports.UrlParam        = UrlParam = {}
UrlParam.quantity       = 'count'
UrlParam.recipe         = 'recipeName'
UrlParam.includingTools = 'tools'
