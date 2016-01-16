class User < ActiveRecord::Base
  has_many :time_entries

  validates :slack_name, :slack_id, presence: true
  validates :slack_id, uniqueness: true

  # TODO: Test
  def self.find_or_update_by(params)
    slack_id = params[:user_id]
    slack_name = params[:user_name]

    User
      .create_with(slack_name: slack_name)
      .find_or_create_by(slack_id: slack_id)
      .tap do |account|
        account.update_attribute(:slack_name, slack_name) if account.name != slack_name
      end
  end

  def name
    slack_name
  end

  def running_activity?
    running_activity.present?
  end

  def running_activity
    @running_activity ||= time_entries.find_by end: nil
  end

  def stop_running_activity
    running_activity&.update_attribute(:end, Time.current)
  end
end
