
    require('rspec')
    require('festival')

    describe(Stage) do
    describe('#self.all') do
      it('test') do
        test = Stage.new()
        expect(test.self.all()).to(eq('test'))
      end
    end
  end
  