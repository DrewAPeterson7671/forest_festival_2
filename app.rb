require('sinatra')
    require('sinatra/reloader')
    require('./lib/festival')
    also_reload('lib/**/*.rb')
    get('/') do

    end
    get('/festival') do

    end

    get('/festival/new') do

    end

    get('/festival/:id') do

    end
    post('/festival') do

    end

    get('/festival/:id/edit') do

    end

    patch('/festival/:id') do

    end

    delete('/festival/:id') do

    end

    get('/custom_route') do

    end
    