shared_context 'Session::Relation' do
  let(:users)    { session[:users] }
  let(:object)   { users }

  let(:session)  { Session.new(env) }
  let(:env)      { Session::Environment.new({ :users => relation }, tracker) }
  let(:tracker)  { Session::Tracker.new }

  let(:mapper)   { Mapper.build(Mapper::Header.coerce([[:id, Integer], [:name, String]], :keys => [:id]), model) }
  let(:model)    { mock_model(:id, :name) }
  let(:axiom)    { Axiom::Relation.new(SCHEMA[:users].header, [ [ 1, 'John' ], [ 2, 'Jane' ] ]) }
  let(:relation) { Relation.new(axiom, mapper) }

  let(:user) { session[:users].all.first }
end