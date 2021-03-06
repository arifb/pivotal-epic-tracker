require "pivotal-tracker"
require "pivotal-epic-tracker/version"

# Public: A gem that utilizes the pivotal-tracker gem to track epic's
# the way we do at chimp (http://chimp.net).
#
# Return epic status information for a project and label. An epic
# is in one of the following states:
#   Specced: if there is a needs-design label on associated ticket
#   Designed: if there is a ready-to-code label on associated ticket
#   Tested: if all tickets are accepted
#
module PivotalEpicTracker

  def connect_to_project(token, project_id, use_ssl = true)
    PivotalTracker::Client.token = token
    PivotalTracker::Client.use_ssl = use_ssl
    PivotalTracker::Project.find(project_id)
  end

  # Public: return an EpicStatus object giving visibility to a Pivotal Epic
  # and whether it is specced, designed, tested. Also gives visibility to the 
  # number of total stories and how many of those are delivered.
  #
  def get_epic_status(project, label)
    e = EpicStatus.new(project, label)
    e.get_status
    e
  end

  class EpicStatus
    attr_accessor :specced, :designed, :tested, :num_stories, :num_stories_delivered

    def initialize(project, label)
      @project = project
      @epic_label = label
      @stories = get_stories
      @stories_labels = get_labels
    end

    def get_status
      self.num_stories = @stories.size
      self.num_stories_delivered = get_num_stories_delivered
      self.specced = is_specced?
      self.designed = is_designed?
      self.tested = is_tested?
    end

    def get_stories
      @project.stories.all(:label => @epic_label, :includedone => true)
    end

    def get_labels
      labels = []
      @stories.each do |s|
        s.labels.each do |l|
          temp = l.split(",")
          labels << temp
        end
      end
      labels.flatten
    end

    def is_specced?
      if self.num_stories_delivered == self.num_stories && self.num_stories != 0
        true
      else
        @stories_labels.include?("needs-design")
      end
    end

    def is_designed?
      if self.num_stories_delivered == self.num_stories && self.num_stories != 0
        true
      else
        @stories_labels.include?("ready-to-code")
      end
    end

    def is_tested?
      untested_stories = @stories.reject {|s| s.current_state == 'accepted'}
      untested_stories.size == 0 && self.num_stories != 0
    end

    def get_num_stories_delivered
      stories_delivered = 0
      @stories.each {|s| stories_delivered += 1 if s.current_state == 'delivered' || s.current_state == 'accepted'}
      stories_delivered
    end

  end
end
