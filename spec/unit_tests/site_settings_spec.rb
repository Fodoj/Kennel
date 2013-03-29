
describe 'SiteSettings' do
  describe 'create singleton instance' do
    it 'should singleton be created' do
      pending
      # testAdminSettings=SiteSettings.instance
      # testAdminSettings2=SiteSettings.instance
      # testAdminSettings == testAdminSettings2
    end

    it 'should can check the SiteSettings type store options Yaml vs Store' do
      pending
    end
  end
end

describe 'check preferences store with YAML' do
  it 'should save value for setting name given ' do
    # Not realize, because will change original 'settings.yml'
  end

  it 'should get value for the setting name given ' do
    # Not realize, because will change original 'settings.yml'
  end
end

describe 'check preferences store with ActiveRecord::Store ' do
  it 'should SAVE value for setting name given ' do
    SiteSetting.create settings: {}
    SiteSettings::StoreStore.set 'test', 123
    SiteSetting.first.settings[:test] == 123
  end

  it 'should GET value for the setting name given ' do
    SiteSetting.create settings: { test: 123}
    SiteSettings::StoreStore.get('test') == 123
  end
end