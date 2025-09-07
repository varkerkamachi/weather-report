class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


    # -- enhancement for later - reusable helper methods for JSON responses
    # def json_success_message
    #     render_json_success_response_object('success.status_200', 200)
    # end

    # def render_json_success_response_object keys='', status=200, msg=nil
    #   {
    #     "success": {
    #       "status": status,
    #       "detail": msg.present? ? msg :  keys
    #     }
    #   }
    # end
end
