class SampleController < ApplicationController
  # todo:確認画面作る
  
  def index
    # hello_react.jsxを呼ぶ用
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      render plain: "ユーザーを登録しました（仮実装）"

    else
      flash.now[:alert] = "エラーがあります"
      render :new, status: :unprocessable_entity
    end
  end

  def erb_only
    # erb_only.html.erbを呼ぶ用
  end

  def erb_to_react
    # erb_to_react.html.erbを呼ぶ用
  end

  private

  def user_params
    # 仮
    birthdate = nil
    begin
      year = params[:user]["birthdate(1i)"].to_i
      month = params[:user]["birthdate(2i)"].to_i
      day = params[:user]["birthdate(3i)"].to_i
      birthdate = Date.new(year, month, day) if year > 0 && month > 0 && day > 0
    rescue Date::Error
      birthdate = nil
    end

    {
      name: params[:user][:name],
      email: params[:user][:email],
      gender: params[:user][:gender],
      memo: params[:user][:memo],
      has_memo: params[:user][:has_memo] == "1",
      birthdate: birthdate
    }
  end
end