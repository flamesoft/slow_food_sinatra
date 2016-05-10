require './lib/helpers/data_mapper.rb'
require './lib/models/user.rb'

describe User do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :username }
  it { is_expected.to have_property :password }

end
