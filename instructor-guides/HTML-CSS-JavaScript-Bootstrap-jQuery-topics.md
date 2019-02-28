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
    * dates
        * new Date()
        * .toISOString()
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

### HTML JS Interface
        * document
            * getElementById(n)
                * value
                * innerText
                * innerHTML
            * write
        * console
            * log