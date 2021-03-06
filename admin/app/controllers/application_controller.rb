class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :publish_page_view

  protected

  def publish_page_view
    Publisher.publish("page_views",
      site: "admin",
      path: request.path,
      method: request.method
    )
  end
end
