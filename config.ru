require './config/environment'

use Rack::MethodOverride #allows for patch and delete requests

use BreakController
use BoardController
use LeashController
use UserController
run ApplicationController
