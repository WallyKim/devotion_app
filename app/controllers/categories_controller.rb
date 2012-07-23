# coding: utf-8

class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def version
    render :json => {
                  :version => '1.0.0'
                }
  end

  def create
    @category = current_user.categories.build(params[:category])
    # /*
     # * if @category.title == 'Genesis'
      # @category[:title] = '창세기'
      # @category[:bible_id] = 1
    # elsif @category.title == 'Exodus'
      # @category[:title] = '출애굽기'
      # @category[:bible_id] = 2
    # elsif @category.title == 'Leviticus' 
      # @category[:title] = '레위기'
      # @category[:bible_id] = 3
    # elsif @category.title == 'Numbers'
      # @category[:title] = '민수기'
      # @category[:bible_id] = 4
    # elsif @category.title == 'Deuteronomy'
      # @category[:title] = '신명기'
      # @category[:bible_id] = 5
    # elsif @category.title == 'Joshua'
      # @category[:title] = '여호수아'
      # @category[:bible_id] = 6
    # elsif @category.title == 'Judges'
      # @category[:title] = '사사기'
      # @category[:bible_id] = 7
    # elsif @category.title == 'Ruth'
      # @category[:title] = '룻기'
      # @category[:bible_id] = 8
    # elsif @category.title == '1 Samuel'
      # @category[:title] = '사무엘상'
      # @category[:bible_id] = 9
    # elsif @category.title == '2 Samuel'
      # @category[:title] = '사무엘하'
      # @category[:bible_id] = 10
    # elsif @category.title == '1 Kings'
      # @category[:title] = '열왕기상'
      # @category[:bible_id] = 11
    # elsif @category.title == '2 Kings'
      # @category[:title] = '열왕기하'
      # @category[:bible_id] = 12
    # elsif @category.title == '1 Chronicles'
      # @category[:title] = '역대상'
      # @category[:bible_id] = 13
    # elsif @category.title == '2 Chronicles'
      # @category[:title] = '역대하'
      # @category[:bible_id] = 14
    # elsif @category.title == 'Ezra'
      # @category[:title] = '에스라'
      # @category[:bible_id] = 15
    # elsif @category.title == 'Nehemiah'
      # @category[:title] = '느헤미야'
      # @category[:bible_id] = 16
    # elsif @category.title == 'Esther'
      # @category[:title] = '에스더'
      # @category[:bible_id] = 17
    # elsif @category.title == 'Job'
      # @category[:title] = '욥기'
      # @category[:bible_id] = 18
    # elsif @category.title == 'Psalms'
      # @category[:title] = '시편'
      # @category[:bible_id] = 19
    # elsif @category.title == 'Proverbs'
      # @category[:title] = '잠언'
      # @category[:bible_id] = 20
    # elsif @category.title == 'Ecclesiastes'
      # @category[:title] = '전도서'
      # @category[:bible_id] = 21
    # elsif @category.title == 'Song of Songs'
      # @category[:title] = '아가'
      # @category[:bible_id] = 22
    # elsif @category.title == 'Isaiah'
      # @category[:title] = '이사야'
      # @category[:bible_id] = 23
    # elsif @category.title == 'Jeremiah'
      # @category[:title] = '예레미야'
      # @category[:bible_id] = 24
    # elsif @category.title == 'Lamentations'
      # @category[:title] = '예레미야 애가'
      # @category[:bible_id] = 25
    # elsif @category.title == 'Ezekiel'
      # @category[:title] = '에스겔'
      # @category[:bible_id] = 26
    # elsif @category.title == 'Daniel'
      # @category[:title] = '다니엘'
      # @category[:bible_id] = 27
    # elsif @category.title == 'Hosea'
      # @category[:title] = '호세아'
      # @category[:bible_id] = 28
    # elsif @category.title == 'Joel'
      # @category[:title] = '요엘'
      # @category[:bible_id] = 29
    # elsif @category.title == 'Amos'
      # @category[:title] = '아모스'
      # @category[:bible_id] = 30
    # elsif @category.title == 'Obadiah'
      # @category[:title] = '오바댜'
      # @category[:bible_id] = 31
    # elsif @category.title == 'Jonah'
      # @category[:title] = '요나'
      # @category[:bible_id] = 32
    # elsif @category.title == 'Micah'
      # @category[:title] = '미가'
      # @category[:bible_id] = 33
    # elsif @category.title == 'Nahum'
      # @category[:title] = '나훔'
      # @category[:bible_id] = 34
    # elsif @category.title == 'Habakkuk'
      # @category[:title] = '하박국'
      # @category[:bible_id] = 35
    # elsif @category.title == 'Zephaniah'
      # @category[:title] = '스바냐'
      # @category[:bible_id] = 36
    # elsif @category.title == 'Haggai'
      # @category[:title] = '학개'
      # @category[:bible_id] = 37
    # elsif @category.title == 'Zechariah'
      # @category[:title] = '스가랴'
      # @category[:bible_id] = 38
    # elsif @category.title == 'Malachi'
      # @category[:title] = '말라기'
      # @category[:bible_id] = 39
    # elsif @category.title == 'Matthew'
      # @category[:title] = '마태복음'
      # @category[:bible_id] = 40
    # elsif @category.title == 'Mark'
      # @category[:title] = '마가복음'
      # @category[:bible_id] = 41
    # elsif @category.title == 'Luke'
      # @category[:title] = '누가복음'
      # @category[:bible_id] = 42
    # elsif @category.title == 'John'
      # @category[:title] = '요한복음'
      # @category[:bible_id] = 43
    # elsif @category.title == 'Acts'
      # @category[:title] = '사도행전'
      # @category[:bible_id] = 44
    # elsif @category.title == 'Romans'
      # @category[:title] = '로마서'
      # @category[:bible_id] = 45
    # elsif @category.title == '1 Corinthians'
      # @category[:title] = '고린도전서'
      # @category[:bible_id] = 46
    # elsif @category.title == '2 Corinthians'
      # @category[:title] = '고린도후서'
      # @category[:bible_id] = 47
    # elsif @category.title == 'Galatians'
      # @category[:title] = '갈라디아서'
      # @category[:bible_id] = 48
    # elsif @category.title == 'Ephesians'
      # @category[:title] = '에베소서'
      # @category[:bible_id] = 49
    # elsif @category.title == 'Philippians'
      # @category[:title] = '빌립보서'
      # @category[:bible_id] = 50
    # elsif @category.title == 'Colossians'
      # @category[:title] = '골로새서'
      # @category[:bible_id] = 51
    # elsif @category.title == '1 Thessalonians'
      # @category[:title] = '데살로니가전서'
      # @category[:bible_id] = 52
    # elsif @category.title == '2 Thessalonians'
      # @category[:title] = '데살로니가후서'
      # @category[:bible_id] = 53
    # elsif @category.title == '1 Timothy'
      # @category[:title] = '디모데전서'
      # @category[:bible_id] = 54
    # elsif @category.title == '2 Timothy'
      # @category[:title] = '디모데후서'
      # @category[:bible_id] = 55
    # elsif @category.title == 'Titus'
      # @category[:title] = '디도서'
      # @category[:bible_id] = 56
    # elsif @category.title == 'Philemon'
      # @category[:title] = '빌레몬서'
      # @category[:bible_id] = 57
    # elsif @category.title == 'Hebrews'
      # @category[:title] = '히브리서'
      # @category[:bible_id] = 58
    # elsif @category.title == 'James'
      # @category[:title] = '야고보서'
      # @category[:bible_id] = 59
    # elsif @category.title == '1 Peter'
      # @category[:title] = '베드로전서'
      # @category[:bible_id] = 60
    # elsif @category.title == '2 Peter'
      # @category[:title] = '베드로후서'
      # @category[:bible_id] = 61
    # elsif @category.title == '1 John'
      # @category[:title] = '요한1서'
      # @category[:bible_id] = 62
    # elsif @category.title == '2 John'
      # @category[:title] = '요한2서'
      # @category[:bible_id] = 63
    # elsif @category.title == '3 John'
      # @category[:title] = '요한3서'
      # @category[:bible_id] = 64
    # elsif @category.title == 'Jude'
      # @category[:title] = '유다서'
      # @category[:bible_id] = 65
    # else 
      # @category[:title] = '요한계시록'
      # @category[:bible_id] = 65      
    # end
     # */

    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @devotionpost = @category.devotionposts.paginate(page: params[:page])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @devotionpost }
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end
  
  def show
    @category = Category.find(params[:id])
    @devotionpost = @category.devotionposts

    respond_to do |format|
      format.html  # show.html.erb
      format.json { render json: @devotionpost }
    end
  end

  private

    def correct_user
      @category = current_user.categories.find_by_id(params[:id])
      redirect_to root_path if @category.nil?
    end
end