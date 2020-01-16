# HTML/CSS/Javascript/Bootstrap/jQuery
## HTML/CSS
    * HTML - Organizing your data; CSS - Styling your data
    * The format of HTML element (tag)
        * tag name
        * attributes (id, class, style)
            * values in quotes
    * Block vs Inline
    * An HTMl doc - <html><head><title><body>
    * Basic
        * Title - <title>
        * Headings - <h1>..<h6>
        * Paragraph - <p>
        * Span - <span>
        * Tables - <table><thead><tbody><tfoot><tr><td><th>
        * Lists - <ul><ol><li>
        * Horizontal Rule - <hr>
        * Break - <br>
        * Anchor - <a>
        * Div - <div>
        * Image - <img>
        * Label - <label>
        * Navigation - <nav>
        * Section - <section>
        * Create a dialog - <dialog>
        * Script - <script>
        * Style - <style>
        * Link external CSS file - <link>
        * New in HTML5
            * Header - <header>
            * Main - <main>
            * Section - <section>
            * Footer - <footer>
    * Form tags
        * Button - <button>
        * Input - <input>
        * Drop-down list - <select><option>
        * Selection - <select><option>
        * Form - <form>

## CSS

## Javascript
    * The language of the browser
    * Derived from C
    * case sensitive
    * Dynamically typed
    * no classes (no binding properties and methods)
    * No compiler
    * Things to unlearn from C# & Java
        * variables can accept any type
        * operands converted automatically (1 + "1" = "11")
        * functions add1(i) { return i + 1; }
            * no return indicator
            * no type on parameter
            * no restriction on any type (number, string, boolean)
        * semicolon: statement separator
    * "option strict"; must be first line
    * declare variables with 'var'
    * types are:
        * number (all numbers)
        * string
        * boolean (true or false)
        * array []
        * object {} (json)
        * check with 'typeof'
    * comments
        * // - to end of line
        * /* */ - between symbols
    * numbers
        * all floating point (0.1 + 0.2)
        * strings converted to number in all but addition ("5" - "3" = 2)
        * toFixed(n)
        * Number("5")
    * strings: single or double quotes
        * length
        * toString()
        * indexOf("str") // returns index
        * search("str") // returns index
        * substr(start, length)
        * replace("from", "to")
        * toUpperCase(), toLowerCase()
        * concat("first", "second")
        * trim() // trims begin and end
        * split("delim") // to array
    * statements
        * if
        * while
        * do .. while
        * for(;;)
        * for(of)
        * switch
        * == vs ===
    * functions
        * no var in parameters
        * optional return
        * can be passed as a parameter
        * scope bleeding within functions
```
    function test() {
        var a = "a";
        if(true) {
            var b = "b";
        }
        console.log(a, b);
    }
```
    * dates
        * new Date()
        * .toISOString() // in UTC
    * arrays
        * defined with []
        * indexed zero-based
        * push(item), pop() // add/removes last item
        * unshift(item), shift() // add/removes first item
        * delete arr[idx]
        * length // number of items
        * join(",")
        * sort(fnCompare)
    * objects
        * defined with {}
        * key/value items
        * referenced with ["key"] or .key
    * events
        * onClick
        * onLoad
    * Math
        * pow(a, b) // raise number to power
        * random()
        * Math.floor(Math.random() * 10) // 0 to 9

### HTML JS Interface
        * document
            * getElementById(n)
                * value
                * innerText
                * innerHTML
            * write
        * console
            * log

## Bootstrap
    * http://getbootstrap.com
    * <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    * Usable link in QuickStart (CSS)
    * Global styles:
      * Requires HTML5
      * Mobile first: 
        * `<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">`
    * Full Bootstrap support requires jQuery, Popper, and Bootstrap javascript
    * supports latest, stable versions of browsers
        * see browserList in package.json
    * Containers 
        * required to use grid system; 12 horizontally
        * fixed width (class="container")
        * fluid (class="container-fluid") // always 100%
    * Grid
        * classes row & col-xx
            * col-n where 1 <= n <= 12
            * col-xx where nn in (omit, sm, md, lg, xl)
        * columns are left aligned & include gutters
            * remove with no-gutters on row
        * horizontal alignment
            * align-items-start, -center, -end
        * offset-xx-n: skip some columns
    * Content
        * use rem vs em for relative scaling
            * em relative to parent element
            * rem relative to html element
        * browser default font-size is assumed (16px)
    * Typography
        * for a menu:
            * <ul> .list-inline; 
            * <li> .list-inline-item
        * keyboard
            * <kbd>
    * Components
        * Buttons (class="btn btn-xxx")
            * Can be styled as a link: btn-link
        * Tables (class="table table-xx")
            * Color for row: table-primary
        * Table Alt (class="container", class="row", class="col")
        * Forms
            * add class="form-group" to divs
    * Utilities
        * Text: text-primary
        

## jQuery
    * https://jquery.com/
    * Download > Google CDN
    * jQuery commands format: $(selector).method()
        * $ is jquery
        * (selector) is normal css selector
        * .method() function to call; can be chained
    * Ready: $().ready(function() {});
    * CSS: $(selector).css("css-style", "value");
    * addClass(), hasClass() ,removeClass(), toggleClass()
    * attr(), removeAttr
    * append()
    * empty()
    * html()
    * text()
### AJAX with jQuery
    * GET: $.getJSON(url).done().fail().always();
    * POST: $.post(url, data).done().fail().always();
    * done(function(resp) {}) 
        * called on success 
        * response data passed to anon func
    * fail(function(err) {})
        * called on failure
        * err object passed to anon func
    * always(function() {})
        * always called after done or fail