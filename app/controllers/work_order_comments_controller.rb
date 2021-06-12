class WorkOrderCommentsController < ApplicationController
  before_action :set_work_order_comment, only: %i[ show edit update destroy ]

  # GET /work_order_comments or /work_order_comments.json
  def index
    @work_order_comments = WorkOrderComment.all
  end

  # GET /work_order_comments/1 or /work_order_comments/1.json
  def show
  end

  # GET /work_order_comments/new
  def new
    @work_order_comment = WorkOrderComment.new
  end

  # GET /work_order_comments/1/edit
  def edit
  end

  # POST /work_order_comments or /work_order_comments.json
  def create
    @work_order_comment = WorkOrderComment.new(work_order_comment_params)

    respond_to do |format|
      if @work_order_comment.save
        format.html { redirect_to @work_order_comment, notice: "Work order comment was successfully created." }
        format.json { render :show, status: :created, location: @work_order_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work_order_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_order_comments/1 or /work_order_comments/1.json
  def update
    respond_to do |format|
      if @work_order_comment.update(work_order_comment_params)
        format.html { redirect_to @work_order_comment, notice: "Work order comment was successfully updated." }
        format.json { render :show, status: :ok, location: @work_order_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work_order_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_order_comments/1 or /work_order_comments/1.json
  def destroy
    @work_order_comment.destroy
    respond_to do |format|
      format.html { redirect_to work_order_comments_url, notice: "Work order comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order_comment
      @work_order_comment = WorkOrderComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_comment_params
      params.require(:work_order_comment).permit(:user_id, :work_order_id, :comment)
    end
end
