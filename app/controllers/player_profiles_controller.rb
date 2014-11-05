class PlayerProfilesController < ApplicationController
  before_action :set_player_profile, only: [:show, :edit, :update, :destroy]

  def index
    @player_profiles = PlayerProfile.all
    respond_with(@player_profiles)
  end

  def show
    respond_with(@player_profile)
  end

  def new
    @player_profile = PlayerProfile.new
    respond_with(@player_profile)
  end

  def edit
  end

  def create
    @player_profile = PlayerProfile.new(player_profile_params)
    @player_profile.save
    respond_with(@player_profile)
  end

  def update
    @player_profile.update(player_profile_params)
    respond_with(@player_profile)
  end

  def destroy
    @player_profile.destroy
    respond_with(@player_profile)
  end

  private
    def set_player_profile
      @player_profile = PlayerProfile.find(params[:id])
    end

    def player_profile_params
      params[:player_profile]
    end
end
