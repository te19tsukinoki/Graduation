class SessionsController < ApplicationController

  def new
  end

  def create
    #puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    #unko = "tarou"
    #puts params[:subject]
    #puts params.inspect
    #puts unko
    @user = User.find_by(email: params[:session][:email].downcase)
    @subject = params[:subject]
    if @user &.authenticate(params[:session][:password])
      if params[:subject].present?
        increment_attendance(@user, params[:subject])
      end
      reset_session
      log_in @user
      redirect_to @user
    else
      if params[:subject].present?
        flash[:danger] = 'Invalid email/password combination'
        redirect_to subject_path(@subject)
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new', status: :unprocessable_entity
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end

  def increment_attendance(user, subject)
    attendance = user.attendance || user.create_attendance  # 出席情報が存在しない場合は作成する
    case subject
    when "応用数学"
      attendance.update(math: (attendance.math || 0) + 1)
    when "国語"
      attendance.update(japanese: (attendance.japanese || 0) + 1)
    when "英語"
      attendance.update(english: (attendance.english || 0) + 1)
    # 他の教科も同様に追加できる
    end
  end

end
