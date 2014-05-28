require 'spec_helper'

describe User do

  describe "abilities" do
    subject(:ability){ Ability.new(user) }

    context "without user" do
      let(:user){ nil }

      let(:other_user)    { create(:user) }
      let(:other_backlog) { create(:backlog, user: other_user)}

      it{ should_not be_able_to(:manage, other_backlog) }
    end

    context "when present" do
      let(:user) { create(:user) }
      let(:backlog) { create(:backlog, user: user) }

      let(:other_user)    { create(:user) }
      let(:other_backlog) { create(:backlog, user: other_user)}

      it{ should_not be_able_to(:manage, other_backlog) }
      it{ should be_able_to(:manage, backlog)}

      context "wth shared_backlogs" do
        let(:shared_backlog) do
          b = other_backlog
          b.shared_users << user
          b
        end

        it { should be_able_to :read, shared_backlog }
        it { should_not be_able_to :manage, shared_backlog }
      end
    end

  end
end
