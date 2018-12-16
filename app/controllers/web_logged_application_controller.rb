class WebLoggedApplicationController < WebApplicationController

  before_action :authenticate_user!

end
