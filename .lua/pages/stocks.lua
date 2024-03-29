return [[
<body>
    <div class = "wrapper">

    <h1>Do a very Luacrative software.</h1>
    <video class = "art_video" style = "border: none" src="./assets/videos/stocks.mp4" loop autoplay muted></video>
    <h2>Everyone's mom wants them to be a doctor, lawyer, or Lua developer.</h2>
    <p>Making a dividend calculator or stock tracking program doesn't sound terribly compelling, but it's actually more fun than it sounds, and it's
        really great for practicing coding. You can make it as simple or complicated as you want, and if you're learning to code, you'll probably
        need some financial software for all that money you're about to make.
    </p>
    <p>I start mine by making a stock object, with a method to set the stock's initial values- ticker, price and dividend. Then more methods to add stock based 
        on number of shares, and another to buy based on dollar value. The stock object is being returned, but I've also added a getter, just to filter out
        the functions and only return data so it looks better when it's printed.</p>

    <pre>
        <code>
    local stock = {
        shares = 0;
        price = 0;
        dividend = 0;
    }

    function stock.add(n)
        stock.shares = stock.shares + n
        return stock
    end

    function stock.buy(dollars)
        local shares = dollars / stock.price
        stock.shares = stock.shares + shares
        return stock
    end

    function stock.set(ticker, price, dividend)
        stock.ticker, stock.price, stock.dividend = ticker, price, dividend
        return stock
    end

    function stock.get()
        local data = {}
        stock.principal = stock.shares * stock.price
        for i, v in pairs (stock) do
            if type(v) ~= "function" then
                data[i] = v
            end
        end
        return data
    end

    return stock

        </code>
    </pre>

    <p>Usage:</p>
    <pre>
        <code>
    stocks.set('LUA', 35, 0.03)
    stock.buy(500)
    for i,v in pairs(stock.get()) do print (i,v) end

    Output:
    yield       1.05
    shares      14.285714285714
    dividend    0.03
    ticker      LUA
    principal   500.0
    price       35
        </code>
    </pre>

    <p>Okay that's not bad. But it only gives us this month's expected yield. Let's say we want to reinvest our dividend into the principal, aka
        use the DRIP method. We can add a method that will do that using the number of periods as an argument for our for loop. We'll also include an
        optional argument of 'dollars' that will represent any extra money that we want to invest during that period.
    </p>

    <pre>
        <code>
    function stock.compound(periods, dollars)
        dollars = dollars or 0
        for i = 1, periods do
            local yield = stock.shares * stock.dividend
            local shares = ((dollars + yield) / stock.price) or 0
            stock.shares = stock.shares + yield
            stock.shares = stock.shares + shares
        end
        return stock
    end
        </code>
    </pre>

    <p>
    We're already getting into 'useful' territory, but this assumes that the stock's price and dividend will remain the same as its initial value. We
    may want to get into hypotheticals, seeing what would happen if the stock's price or dividend changes. We might add another argument to our 'set'
    method called appreciation, this would become a stock field, and use it as a parameter in 'compound,' or just add it directly as an argument,
    like this:
    </p>

    <pre>
        <code>
    function stock.compound(periods, appreciation, dollars)
        stock.appreciation = appreciation
        dollars = dollars or 0
        for i = 1, periods do
            local yield = stock.shares * stock.dividend
            local shares = ((dollars + yield) / stock.price) or 0
            stock.shares = (stock.shares + shares + yield) * appreciation
        end
        return stock
    end
        </code>
    </pre>

    <p>So now we can run hypothetical outcomes through our simulator, but we don't really have a basis for it. It may be helpful here to calculate
        the simple moving average of the stock price. The simple moving average, or SMA, is just an average of the stock's price over a certain period.
        Usually the sample is just taken once a day, at market open or close, but we can abstract out our method a bit, so we can use different inputs.
    </p>
    <pre>
        <code>
    function stock.sm_average(pricetable)
        local type = type(pricetable)
        local message = string.format("Function sm_average expected table, but received %s.", type)
        assert(type == "table", message)

        local count = 0
        local value = 0
        for i, v in pairs(pricetable) do
            count = count + 1
            value = value + v
        end
        stock.sm_average = value / count
        return stock
    end
        </code>
    </pre>

    <p>So, it may look a little different than what you'd expect. Well, so far we've just been working with numbers as arguments, but our averaging method
        actually requires a table of numbers. So I've included an assert. This function merely checks the type to make sure we are entering our argument
        as the correct format, and returns an error if it gets something unexpected. Our loop just has a counter, so we can pass the index to the outer scope. 
        If you don't like the way the counter looks, you could do it differently, like measuring the length of the table with #pricetable.
    </p>

    <p>See? I bet this was a lot more fun than you ever expected! I plan to add a lot more to the article, so check back later for more tips on
        making it to the big time.
    </p>
</div>
</body>
]]