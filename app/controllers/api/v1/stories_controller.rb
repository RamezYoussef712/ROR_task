module Api
  module V1
    class StoriesController < ApplicationController
      def index
        render json: Story.all
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

      def destroy
        Story.find(params[:id]).destroy!

        head :no_content
      end

      private

      def story_params
        params.require(:story).permit(:title, :body)
      end
    end
  end
end

