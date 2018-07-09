class SessionsController < ApplicationController
  def new
    if current_user
      flash[:alert] = "이미 로그인 하셨는데염"
      redirect_to '/'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "#{user.username}님 환영합니다."
        redirect_to '/'
      else
        flash[:alert] = "비밀번호가 틀려용"
        redirect_to :back
      end
    else
      flash[:alert] = "No email!"
      redirect_to '/signup'
    end
  end

  def destroy
    if current_user
      session.clear()
      flash[:notice] = "로그아웃 해뜸!"
      redirect_to '/'
    else
      flash[:alert] = "어딜 접근하십니까"
      redirect_to '/'
    end
  end
end

