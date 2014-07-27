require 'rails_helper'

describe TaskPolicy do
  let(:task) { double('task', user_id: 3) }

  context 'when the task is owned by the user' do
    let(:user) { double('user', id: 3) }
    let(:policy) { TaskPolicy.new(user, task) }

    it 'can be created' do
      expect(policy.create?).to be_truthy
    end

    it 'can be updated' do
      expect(policy.update?).to be_truthy
    end

    it 'can be destroyed' do
      expect(policy.destroy?).to be_truthy
    end
  end

  context 'when the task is not owned by the user' do
    let(:user) { double('user', id: 123) }
    let(:policy) { TaskPolicy.new(user, task) }

    it 'cannot be created' do
      expect(policy.create?).to be_falsy
    end

    it 'cannot be updated' do
      expect(policy.update?).to be_falsy
    end

    it 'cannot be destroyed' do
      expect(policy.destroy?).to be_falsy
    end
  end
end
