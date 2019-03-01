class PostsController < ApplicationController
  include SessionsHelper

  before_action :read_encrypted_cookie, only: [:index, :create]
  
  def index
    posts_json = @user.posts.all.as_json
    render json: {
      success: true,
      code: 200,
      body: {
        posts: posts_json
      }
    }
  end

  def create
    title, place, detail = params[:title], params[:place], params[:detail]
    post = @user.posts.build(
      title: title,
      place: place,
      detail: detail
    )

    if post.save
      render json: {
        success: true,
        code: 200,
        body: {
        }
      }
    else
      render json: {
        success: false,
        code: 500,
        body: {
          message: 'fail to post'
        }
      }
    end
  end

  def show
    post_id = params[:id]
    begin
      post_json = Post.find(post_id).as_json
      render json: {
        success: true,
        code: 200,
        body: {
          post: post_json
        }
      }
    rescue => err
      logger.debug(err)
      render json: {
        success: false,
        code: 500,
        body: {
          message: 'fail to load post information'
        }
      }
    end
  end
end
