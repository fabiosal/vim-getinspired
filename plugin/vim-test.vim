command! GetInspired call GetQuote()

function! GetQuote()
    let l:response = webapi#json#decode(system('curl -s "https://quotes.rest/qod.json"'))
    cexpr " \n".l:response.contents.quotes[0].quote."\n".l:response.contents.quotes[0].author | copen 
endfunction
