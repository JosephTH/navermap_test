class UsersController < ApplicationController
  def index
    user = User.find(params[:id])
    @posts = user.posts
  end

  def new
  end

  def create
    unless User.find_by(email: params[:email])
       @user = User.new(email: params[:email], 
                           password: params[:password], 
                           password_confirmation: params[:password_confirmation],
                           username: params[:username])
      if @user.save
        flash[:notice] = "#{@user.username}님 회원가입을 축하합니다."
        redirect_to '/'
      else
        flash[:alert] = "비밀번호가 일치하지 않습니다."
        redirect_to :back
      end
    else
        flash[:alert] = "이미 가입된 이메일입니다."
        redirect_to :back
    end
  end
end
