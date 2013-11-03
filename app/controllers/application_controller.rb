class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  expose(:environment) { Rails.env }
  #expose(:current_visitor){ current_visitor if current_visitor}

 # before_filter :current_visitor
 # before_filter :set_locale
 # before_filter :authenticate_user
 # after_filter :user_activity

 #def current_visitor
 #  if current_user && current_user.visitor
 #    visitor = current_user.visitor
 #    else
 #      unless cookies[:tracking]
 #        visitor = set_visitor
 #      else
 #        visitor = Visitor.find_by_id(cookies[:tracking])
 #        unless visitor
 #          visitor = set_visitor
 #        else
 #          visitor.params = params
 #          visitor.save
 #        end
 #      if params.keys.any? { |s| s.include?('utm') }
 #        visitor.update_attribute(:params, params)
 #      end
 #    end
 #  end
 #  Pageview.new(:visitor_id => visitor.id, :params => params, :url => request.url).save
 #  v ||= visitor
 #end

 #def set_visitor
 #  visitor = Visitor.new
 #  visitor.account_id = current_account.id if current_account
 #  visitor.remote_addr = request.env["REMOTE_ADDR"].to_s
 #  visitor.http_accept_language = request.env["HTTP_ACCEPT_LANGUAGE"].to_s
 #  visitor.http_user_agent = request.env["HTTP_USER_AGENT"].to_s
 #  visitor.path_info = request.env["PATH_INFO"].to_s
 #  visitor.http_referer = request.env["HTTP_REFERER"].to_s
 #  visitor.params = params
 #  visitor.original_params = params
 #  visitor.utm_source = params[:utm_source]
 #  visitor.utm_medium = params[:utm_medium]
 #  visitor.utm_term = params[:utm_term]
 #  visitor.utm_content = params[:utm_content]
 #  visitor.utm_campaign = params[:utm_campaign]
 #  if visitor.save
 #    cookies.permanent[:tracking] = visitor.id
 #  end
 #  return visitor
 #end

 #private

 #def set_locale
 #  if current_user
 #    I18n.locale = current_user.language
 #  else
 #    I18n.locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'].nil?
 #  end
 #end

 #def authenticate_user
 #  if current_user == nil  && request.env['omniauth.auth']
 #    if User.find_by_facebook_uid(request.env['omniauth.auth'][:uid])
 #      sign_in(User.find_by_facebook_uid(request.env['omniauth.auth'][:uid]), :bypass => true)
 #      redirect_to users_dashboard_path
 #    else
 #      if User.find_by_email(request.env['omniauth.auth'][:info].email)
 #        User.find_by_email(request.env['omniauth.auth'][:info].email).update_attribute(:facebook_uid, request.env['omniauth.auth'][:uid])
 #        sign_in(User.find_by_email(request.env['omniauth.auth'][:info].email), :bypass => true)
 #        redirect_to users_dashboard_path
 #      else
 #        # What to do when they have a facebook but is not linked to a account
 #        session[:facebook_uid] = request.env['omniauth.auth'][:uid]
 #        #session[:omniauth_auth] = request.env['omniauth.auth']
 #        current_visitor.update_attribute(:omniauth, request.env['omniauth.auth'])
 #        redirect_to new_user_registration_path

 #      end
 #    end
 #  end
 #end

 #def user_activity
 #  current_user.try :touch if current_user
 #end
end

