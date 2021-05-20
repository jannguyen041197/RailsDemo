class CommentsController < ApplicationController
    def create
        @product = Product.find(params[:id])
        @comment = @product.comments.create(comment_params)
        @comment.save
        redirect_to products_path(id:@product.id)
    end
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to products_path(id:params[:product_id])
    end
    private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
