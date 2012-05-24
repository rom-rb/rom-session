require 'spec_helper'

describe Session::Session,'#insert?(object)' do
  let(:mapper)        { registry.resolve_model(DomainObject) }
  let(:registry)      { DummyRegistry.new                    }
  let(:domain_object) { DomainObject.new                     }
  let(:object)        { described_class.new(registry)        }

  subject { object.insert?(domain_object) }

  context 'when domain object is marked to be inserted' do
    before do 
      object.insert(domain_object)
    end

    it { should be_true }
  end

  context 'when domain object is NOT marked to be deleted' do
    it { should be_false }
  end
end