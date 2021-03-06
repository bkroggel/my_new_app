class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comments = @product.comments.all.order("created_at DESC") #.paginate(:page => params[:page], :per_page => 5)
    @comments = @comments.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        #Montag, 24. August 2015
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product    
  end

end

private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
    
  end