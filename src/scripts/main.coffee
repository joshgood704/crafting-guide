###
Crafting Guide - main.coffee

Copyright (c) 2014-2015 by Redwood Labs
All rights reserved.
###

# Define Global ########################################################################################################

if typeof(global) is 'undefined'
    window.global = window
    global = window.global

# Define Env ###########################################################################################################

switch window.location.hostname
    when 'localhost'              then global.env = 'development'
    when 'new.crafting-guide.com' then global.env = 'staging'
    when 'crafting-guide.com'     then global.env = 'production'
    else throw new Error "Cannot identify environment of #{window.location.hostname}"

# Global Includes ######################################################################################################

require './underscore_mixins'
require './polyfill'

# Global Variables #####################################################################################################

Logger        = require './logger'
global.logger = new Logger
switch global.env
    when 'localhost'  then logger.level = Logger.DEBUG
    when 'staging'    then logger.level = Logger.VERBOSE
    when 'production' then logger.level = Logger.INFO

CraftingGuideRouter = require './crafting_guide_router'
global.router       = new CraftingGuideRouter

global.util         = require 'util'
global.views        = require './views'

FeedbackController        = require './controllers/feedback_controller'
global.feedbackController = new FeedbackController el:'.view__feedback'
feedbackController.render()

# Start App ############################################################################################################

global.router.loadDefaultModPack()

logger.info -> "CraftingGuide is ready"
Backbone.history.start pushState:true
