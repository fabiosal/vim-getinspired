let s:chunks = ['']

command! GetInspired call FetchQuote()

function! FetchQuote()
    "call jobstart('curl -s "https://quotes.rest/qod.json"',{'on_stdout':'CollectOutput','on_exit':'GetQuote'})
    call jobstart('curl -s "https://api6.ipify.org?format=json"',{'on_stdout':'CollectOutput','on_exit':'GetQuote'})
endfunction

function! CollectOutput(id, data, name)
    let s:chunks[-1] .= a:data[0]
    call extend(s:chunks, a:data[1:])
endfunction

function! GetQuote(...)
    let l:json_response = join(s:chunks,'')
    let l:response = webapi#json#decode(s:chunks[0])
    "cexpr " \n".l:response.contents.quotes[0].quote."\n".l:response.contents.quotes[0].author | copen 
    cexpr " \n".l:response.ip | copen 
endfunction
