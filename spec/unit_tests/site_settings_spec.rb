
describe 'SiteSettings' do
  describe 'create singleton instance' do
    it 'should singleton be created' do
      testAdminSettings=SiteSettings.instance
      testAdminSettings2=SiteSettings.instance
      testAdminSettings == testAdminSettings2
    end

    it 'should can check the SiteSettings type store options Yaml vs Store' do
      pending
    end

  end



end