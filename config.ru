require './config/environment'

use Rack::MethodOverride

use BreaksController
use BoardsController
use LeashesController
use UsersController
run ApplicationController