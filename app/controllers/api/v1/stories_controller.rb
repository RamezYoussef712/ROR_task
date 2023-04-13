module Api
  module V1
    class StoriesController < ApplicationController
      before_action :find_targeted_story, only: [:review]

      def index
        user = User.find(params[:user_id])

        render json: { message: 'user not found' }, status: :not_found unless user
        stories = user.stories
        if stories.empty?
          render json: { message: 'user has no stories ' }, status: :not_found
        else
          render json: paginated_resource(stories)
        end
      end

      def create
        user = User.find(params[:user_id])
        if user
          story = Story.new(story_params.merge(user_id: user.id))

          if story.save
            render json: story, status: :created
          else
            render json: story.errors, status: :unprocessable_entity
          end
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def top_stories
        stories = paginated_resource(Story.top_stories)
        render json: stories
      end

      def review
        review = @story.reviews.build(review_params)
        if review.save
          render json: review, status: :created
        else
          render json: { error: review.errors.full_messages }, status: :unprocessable_entity
        end

      end

      def destroy
        Story.find(params[:id]).destroy!

        head :no_content
      end

      private

      def story_params
        params.require(:story).permit(:title, :body)
      end

      def find_targeted_story
        if params[:id].present?
          @story = Story.find(params[:id])
          if @story.nil?
            render json: { error: "cant found that story" }, status: :not_found
          end
        else
          render json: { error: "pls provide a n id param" }, status: :bad_request
        end
      end

      def review_params
        params.require(:review).permit(:rate, :comment, :user_id)
      end

      def paginated_resource(resource)
        page = params[:page] || 1
        per = params[:per] || 10

        resource.page(page).per(per)
      end
    end
  end
end

