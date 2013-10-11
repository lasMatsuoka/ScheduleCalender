# encording: utf-8

class PostsController < ApplicationController

  def index 
    @posts = Post.all

    #first_date に月の初日、end_date に月の末日を代
    day_today  = Date.today
    first_date = Date.new(day_today.year.to_i, day_today.month.to_i)
    end_date   = Date.new(day_today.year.to_i, day_today.month.to_i, -1)
           
    #first_day に初日の日にち、end_day に末日の日にちを代入
    #first_week に初日の曜日を数値で代入
    @first_day         = first_date.day
    @end_day           = end_date.day
    @first_day_of_week = first_date.wday
    @year              = day_today.year
    @month             = day_today.month
  end

  def index_choice
    @posts = Post.all
  end

  def new 
    #今月の
    day_today  = Date.today
    first_date = Date.new(day_today.year.to_i, day_today.month.to_i)
    end_date   = Date.new(day_today.year.to_i, day_today.month.to_i, -1)

    #first_day に初日の日にち、end_day に末日の日にちを代入
    #first_week に初日の曜日を数値で代入
    @first_year        = day_today.year.to_i
    @end_year          = day_today.year.to_i + 5
    @first_day         = first_date.day
    @end_day           = end_date.day
    @first_day_of_week = first_date.wday

    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post]) 
    if params[:commit] == "entry" 
      if @post.save
        redirect_to posts_path
      else
        @post.save

        #今日の日付が含まれる年月日を取得
        day_today  = Date.today
        first_date = Date.new(day_today.year.to_i, day_today.month.to_i)
        end_date   = Date.new(day_today.year.to_i, day_today.month.to_i, -1)

        #first_day に初日の日にち、end_day に末日の日にちを代入
        #first_week に初日の曜日を数値で代入
        @first_year        = day_today.year.to_i
        @end_year          = day_today.year.to_i + 5
        @first_day         = first_date.day
        @end_day           = end_date.day
        @first_day_of_week = first_date.wday

        render action:  'new'
      end
    elsif params[:commit] == "search"
      @posts = Post.all
      @year  = params[:date][:year].to_i
      @month = params[:date][:month].to_i
      @day   = params[:date][:day].to_i

     #first_date に月の初日、end_date に月の末日を代
      first_date = Date.new(@year, @month)
      end_date   = Date.new(@year, @month, -1)

     #first_day に初日の日にち、end_day に末日の日にちを代入
     #first_week に初日の曜日を数値で代入
      @first_day         = first_date.day
      @end_day           = end_date.day
      @first_day_of_week = first_date.wday
      
      render action: 'index_choice'
    else
      render action: 'new'
    end
  end

  def time
    @year  = params[:date][:year].to_i
    @month = params[:date][:month].to_i
    @day   = params[:date][:day].to_i

    #first_date に月の初日、end_date に月の末日を代
    first_date = Date.new(@year, @month)
    end_date   = Date.new(@year, @month, -1)
            
    #first_day に初日の日にち、end_day に末日の日にちを代入
    #first_week に初日の曜日を数値で代入
    @first_day         = first_date.day
    @end_day           = end_date.day
    @first_day_of_week = first_date.wday
   
    redirect_to 'posts/create' 
  end

  def update
    #今月の
    day_today  = Date.today
    first_date = Date.new(day_today.year.to_i, day_today.month.to_i)
    end_date   = Date.new(day_today.year.to_i, day_today.month.to_i, -1)

    #first_day に初日の日にち、end_day に末日の日にちを代入
    #first_week に初日の曜日を数値で代入
    @first_year        = day_today.year.to_i
    @end_year          = day_today.year.to_i + 5
    @first_day         = first_date.day
    @end_day           = end_date.day
    @first_day_of_week = first_date.wday
    
    #データが変更されたかチェック
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: 'Change complete!'
    else
      render action: 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])

    #今月の
    day_today  = Date.today
    first_date = Date.new(day_today.year.to_i, day_today.month.to_i)
    end_date   = Date.new(day_today.year.to_i, day_today.month.to_i, -1)

    #first_day に初日の日にち、end_day に末日の日にちを代入
    #first_week に初日の曜日を数値で代入
    @first_year        = day_today.year.to_i
    @end_year          = day_today.year.to_i + 5
    @first_day         = first_date.day
    @end_day           = end_date.day
    @first_day_of_week = first_date.wday
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def change_day
    @posts = Post.all
  end

end
