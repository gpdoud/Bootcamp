# Angular/Typescript

## Typescript
    * Superset of Javascript
    * Installing: npm install {-g} typescript
    * Compile: tsc filename.ts
    * Types
        * number
        * string
        * boolean
        * array
        * any
        * void (functions only)
        * null
    * Typing
        * variables: `var a: number = 0`
        * functions: function(x: string): boolean {}
            * optional: x?: string
            * default: x: string = "ABC"
        * multiple types: `var b: string | null`
    * Generics: `List<string>`
    * const declaration
    * readonly modifier
    * static
    * Classes
        * properties
        * methods
        * constructor
        * using `this`
    * let vs var
    * Access modifiers: public (default), private, protected
    * Decorators: @expression (expression is a class)
### tsconfig.json
    * tsc --init
    * continuous compiling
        * outDir => js
        * rootDir => ts
        * tsc -w


## Angular